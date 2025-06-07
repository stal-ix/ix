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


def hash(n):
    if n == 'md5':
        return hashlib.md5

    if n == 'sha':
        return hashlib.sha256

    raise Exception(f'unsupported hash name {n}')


def chksum(path, sch):
    func = hash(sch)

    with open(path, 'rb') as f:
        return func(f.read()).hexdigest()


def calc_chksum(path, old_cs):
    if ':' in old_cs:
        sch = old_cs[:old_cs.index(':')]

        return sch + ':' + chksum(path, sch)

    return chksum(path, 'sha')


def fmt_url(url, sha):
    if '{' in url:
        return url.replace('{sha}', sha).replace('{two}', sha[:2])
    else:
        return url + sha


def iter_cached(sha, mirrors):
    for x in mirrors:
        yield fmt_url(x, sha[4:])


def iter_urls(url, sha, mirrors):
    if sha.startswith('sha:') and len(sha) == 68:
        for u in list(iter_cached(sha, mirrors))[:5]:
            yield u, True

    while True:
        yield url, False


def iter_tout():
    tout = 60

    while True:
        yield tout * (0.5 + random.random())

        tout = min(tout * 1.5, 10000)


def do_fetch(url, path, sha, mirrors):
    for (u, best_effort), tout, ff in zip(iter_urls(url, sha, mirrors), iter_tout(), iter_ff()):
        prepare_dir(os.path.dirname(path))

        try:
            ff(u, path, int(tout))

            return check_md5(path, sha)
        except Exception as e:
            if best_effort:
                print(f'while fetching cached {url}, with {sha}: {e}')
            else:
                if '404' in str(e):
                    raise Exception(f'can not fetch {url}:\n{e}'.strip())

                if 'checksum' in str(e):
                    raise e

                print(f'while fetching {url}:\n{e}\nwill retry')

            time.sleep(1)


def check_md5(path, old_cs):
    if '__skip__' in old_cs:
        return

    new_cs = calc_chksum(path, old_cs)

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
    ] + args + [url]

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
            p = p.strip()

            if p:
                yield functools.partial(meth, ['--socks5', p])

        yield functools.partial(meth, [])


def iter_ff():
    while True:
        yield from iter_ff_0()


def main():
    mirrors = list(M.strip().split('\n'))
    best = mirrors[:1]
    good = mirrors[1:]
    random.shuffle(good)
    do_fetch(sys.argv[1], sys.argv[2], sys.argv[3], best + good)


sys.stdout = sys.stderr


try:
    main()
except Exception as e:
    print(e)
    sys.exit(1)
