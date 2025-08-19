import os
import sys
import time
import shutil
import random
import hashlib
import functools
import subprocess

import urllib.error as ue
import urllib.request as ur


random.seed(int(time.time() * 1000000000000))


def prepare_dir(d):
    if not d:
        return

    try:
        shutil.rmtree(d)
    except FileNotFoundError:
        pass

    os.makedirs(d)


def calc_chksum(path):
    with open(path, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()


def fmt_url(url, sha):
    return url.replace('{sha}', sha).replace('{two}', sha[:2]).replace('{one}', sha[:1])


def iter_cached(sha, mirrors):
    for x in mirrors:
        yield fmt_url(x, sha)


def norm_sha(sha):
    if len(sha) != 64:
        return None

    if sha == '1' * 64:
        return None

    return sha


def iter_urls_step(url, sha, mirrors):
    if sha := norm_sha(sha):
        for x in iter_cached(sha, mirrors):
            yield {
                'url': x,
                'cache': True,
            }

    yield {
        'url': url,
        'cache': False,
    }


def iter_urls(good):
    while good:
        yield from list(good.items())


def iter_tout():
    tout = 60

    while True:
        yield tout * (0.5 + random.random())

        tout = min(tout * 1.5, 10000)


def do_fetch(url, path, sha, mirrors):
    good = dict((r['url'], r) for r in iter_urls_step(url, sha, mirrors))

    for (u, rec), tout, ff in zip(iter_urls(good), iter_tout(), iter_ff()):
        prepare_dir(os.path.dirname(path))

        try:
            ff(u, path, int(tout))

            return check_md5(path, sha)
        except Exception as e:
            if 'error: 404' in str(e):
                print(f'404 {u}')
                good.pop(u)
            elif 'checksum' in str(e):
                if rec['cache']:
                    good.pop(u)
                else:
                    raise e
            else:
                print(f'while fetch {u}: {e}')

    raise Exception(f'can not fetch {url}, no sources left')

def check_md5(path, old_cs):
    if '__skip__' in old_cs:
        return

    new_cs = calc_chksum(path)

    if new_cs != old_cs:
        raise Exception(f'got {new_cs} checksum, not {old_cs}')


def tout_prefix(tout):
    return ['timeout', str(tout) + 's']


def safe_decode(s):
    try:
        return s.decode()
    except Exception:
        pass

    return str(s)


def src_hacks(url):
    if 'ghcr.io' in url:
        yield '-H'
        yield 'Authorization: Bearer QQ=='


def fetch_url_curl(args, url, out, tout):
    cmd = tout_prefix(tout) + [
        'curl',
        '-f',
        '--connect-timeout', str(int(0.1 * tout)),
        '--remove-on-error',
        '--retry', '0',
        '-k',
        '-L',
        '--output', out,
    ] + list(src_hacks(url)) + args + [url]

    print(f'run {cmd}')

    try:
        out = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        raise Exception('\n'.join([str(e), safe_decode(e.output)]))

    if b'The requested URL returned error' in out:
        raise Exception(safe_decode(out))

    sys.stdout.buffer.write(out)


def iter_ff_0():
    for meth in [fetch_url_curl]:
        for p in P.strip().split(';'):
            if p := p.strip():
                yield functools.partial(meth, ['--socks5', p])

        yield functools.partial(meth, [])


def iter_ff():
    while True:
        yield from iter_ff_0()


def main():
    mirrors = list(M.strip().split('\n'))
    random.shuffle(mirrors)
    do_fetch(sys.argv[1], sys.argv[2], sys.argv[3].removeprefix('sha:'), mirrors * 3)


sys.stdout = sys.stderr


try:
    main()
except Exception as e:
    print(e)
    sys.exit(1)
