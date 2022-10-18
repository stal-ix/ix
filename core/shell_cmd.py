import os
import sys
import zipfile
import tarfile
import functools
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
        def is_within_directory(directory, target):
            
            abs_directory = os.path.abspath(directory)
            abs_target = os.path.abspath(target)
        
            prefix = os.path.commonprefix([abs_directory, abs_target])
            
            return prefix == abs_directory
        
        def safe_extract(tar, path=".", members=None, *, numeric_owner=False):
        
            for member in tar.getmembers():
                member_path = os.path.join(path, member.name)
                if not is_within_directory(path, member_path):
                    raise Exception("Attempted Path Traversal in Tar File")
        
            tar.extractall(path, members, numeric_owner=numeric_owner) 
            
        
        safe_extract(f)


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


def fetch_url_wget(wget, url, out):
    return subprocess.check_call([wget, '--no-check-certificate', '-O', out, url], shell=False)


def fetch_url_curl(curl, url, out):
    return subprocess.check_call([curl, '-k', '-L', '--output', out, url], shell=False)


def iter_bin():
    yield 'wget', fetch_url_wget
    yield 'curl', fetch_url_curl


def iter_meth_1():
    for p in ['/ix/realm/boot/bin', '/usr/bin']:
        for n, m in iter_bin():
            pp = os.path.join(p, n)

            if os.path.isfile(pp):
                yield functools.partial(m, pp)

    yield fetch_url_impl


def iter_meth():
    while True:
        yield from iter_meth_1()


def fetch_url(url, out):
    print(f'fetch {url} into {out}', file=sys.stderr)

    for meth in iter_meth():
        try:
            return meth(url, out)
        except Exception as e:
            if '404' in str(e):
                raise ce.Error(f'can not fetch {url} into {out}', exception=e)

            print(e)
