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


def iter_cached(sha, mirrors):
    for x in mirrors:
        yield x + sha[4:]


def iter_fetch(url, sha, mirrors):
    if sha.startswith('sha:') and len(sha) == 68:
        def it():
            for u in iter_cached(sha, mirrors):
                yield from iter_fetch_url(u)

        for f in list(it())[:4]:
            yield f, True

    while True:
        for f in iter_fetch_url(url):
            yield f, False


def iter_tout():
    tout = 60

    while True:
        yield tout * (0.5 + random.random())

        tout = min(tout * 1.5, 10000)


def do_fetch(url, path, sha, *mirrors):
    for (f, best_effort), tout in zip(iter_fetch(url, sha, mirrors), iter_tout()):
        prepare_dir(os.path.dirname(path))

        try:
            f(path, int(tout))

            return check_md5(path, sha)
        except Exception as e:
            if best_effort:
                print(f'while fetching cached {url}, with {sha}: {e}')
            else:
                if '404' in str(e):
                    raise Exception(f'can not fetch {url}: {e}')

                if 'checksum' in str(e):
                    raise e

                print(f'while fetching {url}: {e}, will retry')


def check_md5(path, old_cs):
    if '__skip__' in old_cs:
        return

    new_cs = calc_chksum(path, old_cs)

    if new_cs != old_cs:
        raise Exception(f'got {new_cs} checksum, not {old_cs}')


def tout_prefix(tout):
    return ['timeout', str(tout) + 's']


def fetch_url_curl(url, args, out, tout):
    cmd = tout_prefix(tout) + [
        'curl',
        '--retry', '0',
        '-k',
        '-L',
        '--output', out,
    ] + args + [url]

    print(f'run {cmd}')

    return subprocess.check_call(cmd, shell=False)


def iter_fetch_url(url):
    for meth in [fetch_url_curl]:
        for p in P.strip().split(';'):
            yield functools.partial(meth, url, ['--socks5', p])

        yield functools.partial(meth, url, [])


def main():
    mirrors = list(M.strip().split('\n'))
    random.shuffle(mirrors)
    do_fetch(sys.argv[1], sys.argv[2], sys.argv[3], *mirrors)


sys.stdout = sys.stderr


try:
    main()
except Exception as e:
    print(e)
    sys.exit(1)
