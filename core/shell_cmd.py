import ssl
import zipfile
import tarfile

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


def tar(fr, to):
    print('tar {fr} into to')

    with tarfile.open(to, 'x:xz') as f:
        for x in os.listdir(to):
            f.add(os.path.join(to, x), x)


def fetch_url_data(url):
    ssl._create_default_https_context = ssl._create_unverified_context

    return ur.urlopen(url).read()


def fetch_url_impl(url, out):
    print(f'fetch {url} into {out}')

    ssl._create_default_https_context = ssl._create_unverified_context

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


def fetch_url(url, out):
    try:
        return fetch_url_impl(url, out)
    except ue.HTTPError as e:
        raise ce.Error(f'can not fetch {url} into {out}', exception=e)
