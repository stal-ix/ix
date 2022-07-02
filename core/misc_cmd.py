import os
import sys
import code
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


def md5(b):
    return hash('md5')(b).hexdigest()


def sha(b):
    return hash('sha')(b).hexdigest()


def struct_sha(s):
    return sha(json.dumps(s, sort_keys=True).encode())


def read_rec(r):
    if r:
        return r.read()

    return b''


def semantic_checksum(path):
    r = []

    with tarfile.open(path) as tf:
        for rec in tf.getmembers():
            try:
                m = sha(read_rec(tf.extractfile(rec)))
            except KeyError:
                m = 'key error'

            v = [
                rec.name,
                rec.size,
                rec.mode,
                str(rec.type),
                rec.linkname,
                m,
            ]

            r.append(struct_sha(v))

    return struct_sha(list(sorted(r)))


def chksum(path, sch):
    if sch == 'sem':
        return semantic_checksum(path)

    func = hash(sch)

    with open(path, 'rb') as f:
        return func(f.read()).hexdigest()


def calc_chksum(path, old_cs):
    sch = old_cs[:old_cs.index(':')]

    return sch + ':' + chksum(path, sch)


class Iface:
    def untar(self, path):
        csc.untar(path)

    def unzip(self, path):
        csc.unzip(path)

    def fetch_url(self, url, out):
        csc.fetch_url(url, out)

    def check_md5(self, path, old_cs):
        new_cs = calc_chksum(path, old_cs)

        if new_cs != old_cs:
            raise ce.Error(f'expected {new_cs} checksum')

    def header(self):
        if out := os.environ.get('out'):
            prepare_dir(out)

        if tmp := os.environ.get('tmp'):
            prepare_dir(tmp)
            os.chdir(tmp)

    def footer(self):
        if tmp := os.environ.get('tmp'):
            if sys.exc_info()[0]:
                shutil.rmtree(tmp)

    def which(self, x):
        for p in os.environ['PATH'].split(':'):
            pp = os.path.join(p, x)

            if os.path.isfile(pp):
                return pp

        raise ce.Error(f'{x} not found')


def cli_misc_runpy(ctx):
    sys.argv = ['runpy'] + ctx['args']

    g = {
        'ix': Iface(),
    }

    exec(sys.stdin.read(), g, g)


def cli_misc_chksum(ctx):
    args = ctx['args']
    path = args[0]
    kind = args[1]

    res = chksum(path, kind)

    print(f'{kind}:{res}')


def cli_misc_extract(ctx):
    for a in ctx['args']:
        if '.zip' in a:
            csc.unzip(a)
        else:
            csc.untar(a)


def cli_misc_fetch(ctx):
    for a in ctx['args']:
        csc.fetch_url(a, os.path.basename(a))


def cli_misc_repl(ctx):
    code.interact()
