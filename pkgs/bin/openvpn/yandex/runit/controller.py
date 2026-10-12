#!/usr/bin/env python3
"""Supervise a host VPN using a remote Keychain for TLS signatures."""
import asyncio
import base64
import datetime
import fcntl
import hashlib
import ipaddress
import json
import os
from pathlib import Path
import secrets
import signal
import subprocess
import sys

BASE = Path(os.environ.get('YANDEX_VPN_DIR', '/home/pg/.config/yandex-vpn'))
STATUS = Path('/var/run/yandex_vpn/status.json')
DEVICE = 'tun-yandex'
PROTOCOL = '186'


def prepare_signature(encoded, algorithm):
    # RFC 8017 EMSA-PSS-ENCODE for the existing RSA-2048 Keychain identity.
    parts = algorithm.split(',')
    if parts[0] in {'RSA_NO_PADDING', 'RSA_PKCS1_PADDING'} and len(parts) == 1:
        return encoded, algorithm
    if parts[0] != 'RSA_PKCS1_PSS_PADDING':
        raise ValueError('Unsupported signature algorithm')
    params = dict(part.split('=', 1) for part in parts[1:])
    if set(params) != {'hashalg', 'saltlen'} or len(parts) != 3:
        raise ValueError('Unsupported PSS parameters')
    hashes = {'SHA256': hashlib.sha256, 'SHA384': hashlib.sha384, 'SHA512': hashlib.sha512}
    digest = hashes[params['hashalg']]
    message_hash = base64.b64decode(encoded, validate=True)
    hlen = digest().digest_size
    if len(message_hash) != hlen:
        raise ValueError('Invalid digest length')
    emlen = 256
    salt = secrets.token_bytes({'digest': hlen, 'max': emlen - hlen - 2}[params['saltlen']])
    h = digest(b'\0' * 8 + message_hash + salt).digest()
    db = b'\0' * (emlen - hlen - len(salt) - 2) + b'\x01' + salt
    mask = b''.join(digest(h + i.to_bytes(4, 'big')).digest()
                    for i in range((len(db) + hlen - 1) // hlen))
    masked = bytearray(a ^ b for a, b in zip(db, mask))
    masked[0] &= 0x7f
    return base64.b64encode(bytes(masked) + h + b'\xbc').decode(), 'RSA_NO_PADDING'


def config():
    defaults = Path(__file__).with_name('executables.json')
    value = json.loads(defaults.read_text()) if defaults.exists() else {}
    value.update(json.loads((BASE / 'config.json').read_text()))
    return value


def ip(*args, check=True):
    return subprocess.run([config()['ip'], *args], check=check, capture_output=True, text=True)


def destinations():
    cfg = config()
    nets = [ipaddress.ip_network(cfg['dns'] + '/32')]
    nets.extend(ipaddress.ip_network(value, strict=True) for value in cfg['routes'])
    for net in nets:
        # A typo must not create a default or cover LAN/mesh networks.
        if net.prefixlen < (16 if net.version == 4 else 32):
            raise ValueError('VPN route is too broad')
        if net.version == 4 and any(net.overlaps(ipaddress.ip_network(local))
                                   for local in ('10.0.0.0/24', '192.168.100.0/24', '127.0.0.0/8')):
            raise ValueError('VPN route overlaps a local network')
    return nets


def guards():
    for net in destinations():
        family = '-4' if net.version == 4 else '-6'
        # Keep these routes while disconnected, so corporate DNS cannot escape
        # through the normal default route. Connected routes have lower metrics.
        existing = ip(family, 'route', 'show', 'exact', str(net)).stdout
        if not any('unreachable' in line and 'metric 42760' in line for line in existing.splitlines()):
            ip(family, 'route', 'add', 'unreachable', str(net), 'metric', '42760', 'proto', PROTOCOL)


def network_up():
    if os.environ.get('dev') != DEVICE:
        raise ValueError('Unexpected VPN interface')
    v4 = ipaddress.ip_interface(os.environ['ifconfig_local'] + '/' + os.environ['ifconfig_netmask'])
    if (v4.version != 4 or v4.network.prefixlen < 24
            or not v4.ip in ipaddress.ip_network('10.0.0.0/8')
            or v4.network.overlaps(ipaddress.ip_network('10.0.0.0/24'))):
        raise ValueError('Unexpected VPN IPv4 assignment')
    ip('link', 'set', 'dev', DEVICE, 'up')
    ip('-4', 'address', 'replace', str(v4), 'dev', DEVICE)
    if os.environ.get('ifconfig_ipv6_local'):
        v6 = ipaddress.ip_interface(os.environ['ifconfig_ipv6_local'] + '/' + os.environ['ifconfig_ipv6_netbits'])
        if (v6.version != 6 or v6.network.prefixlen < 64
                or not v6.ip in ipaddress.ip_network('2a02:6b8::/29')):
            raise ValueError('Unexpected VPN IPv6 assignment')
        ip('-6', 'address', 'replace', str(v6), 'dev', DEVICE, 'nodad')
    guards()
    for net in destinations():
        ip('-4' if net.version == 4 else '-6', 'route', 'replace', str(net),
           'dev', DEVICE, 'metric', '100', 'proto', PROTOCOL)


def state(connected, phase, **extra):
    STATUS.parent.mkdir(parents=True, exist_ok=True)
    value = dict(connected=connected, phase=phase,
                 checked_at=datetime.datetime.now(datetime.timezone.utc).isoformat(), **extra)
    temporary = STATUS.with_suffix('.tmp')
    temporary.write_text(json.dumps(value) + '\n')
    temporary.chmod(0o644)
    temporary.replace(STATUS)


async def stop(process):
    if process and process.returncode is None:
        try:
            process.terminate()
        except ProcessLookupError:
            return
        try:
            await asyncio.wait_for(process.wait(), 8)
        except asyncio.TimeoutError:
            process.kill()
            await process.wait()


async def session():
    cfg = config()
    vpn = signer = writer = None
    management = BASE / 'management.sock'
    try:
        management.unlink(missing_ok=True)
        env = os.environ.copy()
        env.pop('LD_LIBRARY_PATH', None)
        env['YANDEX_VPN_DIR'] = str(BASE)
        vpn = await asyncio.create_subprocess_exec(
            cfg['openvpn'], '--config', str(BASE / 'client.ovpn'),
            '--management', str(management), 'unix',
            '--up', str(Path(__file__).with_name('network-up')),
            '--log-append', str(BASE / 'openvpn.log'), env=env)
        for _ in range(100):
            try:
                reader, writer = await asyncio.open_unix_connection(str(management))
                break
            except (FileNotFoundError, ConnectionRefusedError):
                if vpn.returncode is not None:
                    raise RuntimeError('VPN exited before management startup')
                await asyncio.sleep(0.1)
        if writer is None:
            raise RuntimeError('Management socket unavailable')
        signer = await asyncio.create_subprocess_exec(*cfg['signer_command'],
            stdin=asyncio.subprocess.PIPE, stdout=asyncio.subprocess.PIPE)

        async def request(value):
            signer.stdin.write((json.dumps(value) + '\n').encode())
            await signer.stdin.drain()
            line = await asyncio.wait_for(signer.stdout.readline(), 20)
            if not line:
                raise RuntimeError('Keychain signer disconnected')
            answer = json.loads(line)
            if 'error' in answer:
                raise RuntimeError('Keychain refused a signing request')
            return answer

        async def send(value):
            writer.write(value.encode())
            await writer.drain()

        certificate = (await request({'op': 'cert'}))['certificate']
        if not certificate.startswith('-----BEGIN CERTIFICATE-----\n'):
            raise RuntimeError('Invalid certificate response')
        await send('version 3\nstate on\nhold off\nhold release\n')
        connected = False
        phase = 'CONNECTING'
        while True:
            try:
                raw = await asyncio.wait_for(reader.readline(), 15)
            except asyncio.TimeoutError:
                state(connected, phase, vpn_pid=vpn.pid)
                continue
            if not raw:
                raise RuntimeError('OpenVPN management disconnected')
            line = raw.decode().strip()
            if line.startswith('>NEED-CERTIFICATE:'):
                await send('certificate\n' + certificate + 'END\n')
            elif line.startswith('>PK_SIGN:'):
                payload, sep, algorithm = line[len('>PK_SIGN:'):].partition(',')
                if not sep:
                    raise RuntimeError('Missing signature algorithm')
                payload, algorithm = prepare_signature(payload, algorithm)
                signature = (await request({'op': 'sign', 'data': payload, 'algorithm': algorithm}))['signature']
                base64.b64decode(signature, validate=True)
                await send('pk-sig\n' + signature + '\nEND\n')
                print('TLS handshake signed through work Keychain', flush=True)
            elif line.startswith('>STATE:'):
                fields = line[len('>STATE:'):].split(',')
                phase = fields[1]
                connected = fields[1:3] == ['CONNECTED', 'SUCCESS']
                state(connected, phase, vpn_pid=vpn.pid)
                print('VPN state:', phase, flush=True)
            elif line.startswith(('>FATAL:', 'ERROR:', '>PASSWORD:')):
                raise RuntimeError('VPN authentication/configuration requires attention')
    finally:
        if writer:
            writer.close()
        await stop(vpn)
        await stop(signer)
        # No persistent TUN: closing OpenVPN removes its interface and routes.
        state(False, 'DISCONNECTED')


async def serve():
    task = asyncio.current_task()
    for sig in (signal.SIGTERM, signal.SIGINT):
        asyncio.get_running_loop().add_signal_handler(sig, task.cancel)
    guards()
    while True:
        try:
            await session()
        except asyncio.CancelledError:
            return
        except Exception as error:
            # Never log management payloads, certificates or auth tokens.
            reason = str(error) if isinstance(error, RuntimeError) else type(error).__name__
            print('VPN retry:', reason, flush=True)
            state(False, 'RETRY', error=reason)
            await asyncio.sleep(10)


if __name__ == '__main__':
    os.umask(0o077)
    if len(sys.argv) > 1 and sys.argv[1] == 'up':
        network_up()
    else:
        with (BASE / 'controller.lock').open('w') as lock:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
            try:
                asyncio.run(serve())
            except (KeyboardInterrupt, asyncio.CancelledError):
                pass
