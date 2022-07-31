import os
import sys
import shutil
import hashlib

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


def check_md5(path, old_cs):
    new_cs = calc_chksum(path, old_cs)

    if new_cs != old_cs:
        raise ce.Error(f'expected {new_cs} checksum')


def cli_misc_cksum(ctx):
    args = ctx['args']

    old = args[0]
    new = args[1]
    md5 = args[2]

    print(f'check {old} checksum, expect {md5}')

    check_md5(old, md5)
    prepare_dir(os.path.dirname(new))
    os.link(old, new)


def cli_misc_link(ctx):
    args = ctx['args']

    out = args[0]

    prepare_dir(out)
    os.chdir(out)

    for f in args[1:]:
        print(f'link {f} into {out}')
        os.link(f, os.path.basename(f))
