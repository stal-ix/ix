import zipfile
import tarfile


def unzip(path):
    print(f'unzip {path}')

    with zipfile.ZipFile(path, 'r') as f:
        f.extractall()


def untar(path):
    print(f'untar {path}')

    with tarfile.open(path) as f:
        f.extractall()
