import os
import sys
import json
import shutil
import hashlib
import tarfile

import core.error as ce
import core.shell_cmd as csc


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
    sch = old_cs[:old_cs.index(':')]

    return sch + ':' + chksum(path, sch)


class Iface:
    def fetch_url(self, url, out):
        csc.fetch_url(url, out)

    def check_md5(self, path, old_cs):
        new_cs = calc_chksum(path, old_cs)

        if new_cs != old_cs:
            raise ce.Error(f'expected {new_cs} checksum')


def cli_misc_runpy(ctx):
    sys.argv = ['runpy'] + ctx['args']

    g = {
        'ix': Iface(),
    }

    exec(sys.stdin.read(), g, g)


def cli_misc_extract(ctx):
    for a in ctx['args']:
        if '.zip' in a:
            csc.unzip(a)
        else:
            csc.untar(a)


def cli_misc_fetch(ctx):
    args = ctx['args']
    url = args[0]
    path = args[1]
    prepare_dir(os.path.dirname(path))
    csc.fetch_url(url, path)
