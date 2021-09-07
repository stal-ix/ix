import ssl
import zipfile
import tarfile

import urllib.request as ur


def unzip(path):
    print('unzip ' + path)

    with zipfile.ZipFile(path, 'r') as f:
        f.extractall()


def untar(path):
    print('untar ' + path)

    with tarfile.open(path) as f:
        f.extractall()


def fetch_url(url, out):
    print('fetch ' + url + ' into ' + out)

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
