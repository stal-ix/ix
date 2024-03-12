import os
import sys
import functools
import subprocess

import urllib.error as ue
import urllib.request as ur

import core.error as ce


def fetch_url_data(url):
    return ur.urlopen(url).read()


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


def fetch_url_wget(wget, url, out, tout):
    return subprocess.check_call([wget, '--timeout', str(tout), '-t', '1', '--no-check-certificate', '-O', out, url], shell=False)


def fetch_url_curl(curl, url, out, tout):
    return subprocess.check_call([curl, '--connect-timeout', str(tout), '--retry', '0', '-k', '-L', '--output', out, url], shell=False)


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
