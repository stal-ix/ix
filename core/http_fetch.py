import os
import sys
import shutil
import functools
import subprocess

import core.error as ce


def call(cmd):
    print(cmd, file=sys.stderr)

    return subprocess.check_call(cmd, shell=False)


def fetch_url_wget(wget, url, out, tout):
    extra = []

    if 'ghcr.io' in url:
        extra = ['--header=Authorization: Bearer QQ==']

    return call([wget] + extra + ['--timeout', str(tout), '-t', '1', '--no-check-certificate', '-O', out, url])


def fetch_url_curl(curl, url, out, tout):
    extra = []

    if 'ghcr.io' in url:
        extra = ['-H', 'Authorization: Bearer QQ==']

    return call([curl] + extra + ['--connect-timeout', str(tout), '--retry', '0', '-k', '-L', '--output', out, url])


def iter_bin():
    yield 'wget', fetch_url_wget
    yield 'curl', fetch_url_curl


def iter_meth():
    cnt = 0

    for n, m in iter_bin():
        if p := shutil.which(n):
            cnt += 1

            yield functools.partial(m, p)

    if cnt == 0:
        raise ce.Error('can not find curl or wget binary')


def iter_fetch_url(url):
    for meth in iter_meth():
        yield functools.partial(meth, url)
