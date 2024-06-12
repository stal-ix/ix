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


def prepare_dir(d):
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

        for f in list(sorted(list(it()), key=lambda x: random.random()))[:10]:
            yield f, True

    while True:
        for f in iter_fetch_url(url):
            yield f, False


def do_fetch(url, path, sha, *mirrors):
    prepare_dir(os.path.dirname(path))

    tout = 5

    for f, best_effort in iter_fetch(url, sha, mirrors):
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

                print(f'while fetching {url}: {e}, will retry after {tout}')

                time.sleep(tout)
                tout = min(tout * 1.5, 200)


def check_md5(path, old_cs):
    new_cs = calc_chksum(path, old_cs)

    if new_cs != old_cs:
        raise Exception(f'got {new_cs} checksum, not {old_cs}')


def fetch_url_impl(url, out, tout):
    print(f'fetch {url} into {out}')

    def iter_chunks():
        r = ur.urlopen(url, timeout=tout)

        while True:
            c = r.read(1 * 1024 * 1024)

            if c:
                yield c
            else:
                return

    with open(out, 'wb') as f:
        cnt = 0

        for c in iter_chunks():
            cnt += len(c)

            print('\r' + chr(27) + '[0K' + f'got {cnt} bytes', end='')

            f.write(c)

        print('')


def tout_prefix(tout):
    return ['/bin/subreaper', '/bin/timeout', str(tout) + 's']


def fetch_url_wget(wget, url, out, tout):
    return subprocess.check_call(tout_prefix(tout) + [wget, '-t', '1', '--no-check-certificate', '-O', out, url], shell=False)


def fetch_url_curl(curl, url, out, tout):
    return subprocess.check_call(tout_prefix(tout) + [curl, '--retry', '0', '-k', '-L', '--output', out, url], shell=False)


def iter_bin():
    yield 'wget', fetch_url_wget
    yield 'curl', fetch_url_curl


def iter_meth():
    for p in ['/bin', '/bin/bin_ix', '/ix/realm/boot/bin', '/usr/bin']:
        for n, m in iter_bin():
            pp = os.path.join(p, n)

            if os.path.isfile(pp):
                yield functools.partial(m, pp)

    yield fetch_url_impl


def iter_fetch_url(url):
    for meth in iter_meth():
        yield functools.partial(meth, url)


def main():
    mirrors = list(M.strip().split('\n'))
    do_fetch(sys.argv[1], sys.argv[2], sys.argv[3], *mirrors)


try:
    main()
except Exception as e:
    print(e, file=sys.stderr)
    sys.exit(1)
