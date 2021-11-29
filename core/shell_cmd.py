import os
import zipfile
import tarfile
import subprocess

import urllib.error as ue
import urllib.request as ur

import core.error as ce


def unzip(path):
    print(f'unzip {path}')

    with zipfile.ZipFile(path, 'r') as f:
        f.extractall()


def untar(path):
    print(f'untar {path}')

    with tarfile.open(path) as f:
        f.extractall()


def fetch_url_data(url):
    return ur.urlopen(url).read()


def fetch_url_impl(url, out):
    print(f'fetch {url} into {out}')

    def iter_chunks():
        r = ur.urlopen(url)

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


def fetch_url_wget(url, out):
    return subprocess.check_call(['/usr/bin/wget', '-O', out, url], shell=False)


def fetch_url(url, out):
    def iter_meth():
        while True:
            yield fetch_url_impl
            yield fetch_url_wget

    for meth in iter_meth():
        try:
            return meth(url, out)
        except Exception as e:
            if '404' in str(e):
                raise ce.Error(f'can not fetch {url} into {out}', exception=e)

            print(e)
