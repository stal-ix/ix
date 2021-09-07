import os
import sys
import shutil
import hashlib

import core.shell as cs
import core.error as ce
import core.shell_cmd as csc


def prepare_dir(d):
    try:
        shutil.rmtree(d)
    except FileNotFoundError:
        pass

    os.makedirs(d)


class Iface:
    def untar(self, path):
        csc.untar(path)

    def unzip(self, path):
        csc.unzip(path)

    def fetch_url(self, url, out):
        csc.fetch_url(url, out)

    def check_md5(self, path, old_md5):
        with open(path, 'rb') as f:
            new_md5 = hashlib.md5(f.read()).hexdigest()

            if new_md5 != old_md5:
                raise ce.Error('expected ' + new_md5 + ' checksum')

    def header(self):
        out = os.environ.get('out')

        if out:
            prepare_dir(out)

        tmp = os.environ.get('tmp')

        if tmp:
            prepare_dir(tmp)
            os.chdir(tmp)

    def footer(self):
        tmp = os.environ.get('tmp')

        if tmp:
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
        'mix': Iface(),
    }

    exec(sys.stdin.read(), g, g)


def cli_misc_runph(ctx):
    def iter_env():
        yield from os.environ.items()

        for k, v in enumerate(['runph'] + ctx['args']):
            yield str(k), v

    cs.interpret(sys.stdin.read(), dict(iter_env()))


def cli_misc_untar(ctx):
    for a in ctx['args']:
        csc.untar(a)


def cli_misc_unzip(ctx):
    for a in ctx['args']:
        csc.unzip(a)
