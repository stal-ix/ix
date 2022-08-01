import os
import sys
import json
import subprocess

import core.error as ce


B = '/bin/bin_ix'
L = '/bin/liner'


def run_cmd(cmd, input=''):
    cmd = [
        '/bin/sudo',
        '/bin/chrt', '-i', '0',
        '/bin/nice', '-n', '20',
        '/bin/su', '-s',
        cmd[0], '-', 'ix'
    ] + cmd[1:]

    try:
        subprocess.run(cmd, shell=False, input=input.encode(), check=True)
    except Exception as e:
        if '1' in str(e) or '2' in str(e):
            raise ce.Error('shit happen', exception=e, visible=False)

        raise e


def fix_md5(md5):
    if ':' in md5:
        return md5[md5.index(':') + 1:]

    return md5


def gen_fetch(url, path, md5):
    odir = os.path.dirname(path)

    yield [
        L, 'rmrf', odir,
        L, 'mkdir', odir,
        f'{B}/curl', '-k', '-L', '-o', path, url,
    ]

    if len(md5) > 10 and 'sem:' not in md5:
        yield [
            L, 'cksum', fix_md5(md5), path,
        ]


def show_cksum(sb, fr):
    return [
        sb.cmd(['/bin/sha256sum', fr]),
        sb.cmd(['/bin/false']),
    ]


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg

    def execute_graph(self, graph):
        run_cmd([f'{B}/assemble'], input=json.dumps(graph))

    def gc(self):
        run_cmd([sys.executable, self.cfg.binary, 'gc'])

    def runpy(self, args):
        return [f'{B}/python', '-'] + args

    def extract(self):
        return [f'{B}/bsdtar', '--no-same-permissions', '--no-same-owner', '-x', '-f']

    def fetch(self, sb, url, path, md5):
        return [sb.cmd(x) for x in gen_fetch(url, path, md5)]

    def cksum(self, sb, fr, to, md5):
        if len(md5) < 16:
            return show_cksum(sb, fr)

        odir = os.path.dirname(to)

        cmd = [
            L, 'cksum', fix_md5(md5), fr,
            L, 'rmrf', odir,
            L, 'mkdir', odir,
            L, 'link', fr, to,
        ]

        return [sb.cmd(cmd)]

    def link(self, sb, files, out):
        def it():
            yield from (L, 'rmrf', out)
            yield from (L, 'mkdir', out)

            for x in files:
                yield from (L, 'link', x, os.path.join(out, os.path.basename(x)))

        return [sb.cmd(list(it()))]
