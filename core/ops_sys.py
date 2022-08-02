import os
import sys
import json
import subprocess

import core.utils as cu
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


def gen_show_cksum(path):
    yield ['/bin/sha256sum', path]
    yield ['/bin/false']


def show_cksum(sb, path):
    return [sb.cmd(x) for x in gen_show_cksum(path)]


def gen_fetch(url, path, md5):
    odir = os.path.dirname(path)

    yield ['/bin/rm', '-rf', odir]
    yield ['/bin/mkdir', '-p', odir]
    yield [f'{B}/curl', '-k', '-L', '-o', path, url]

    if 'sem:' not in md5:
        if len(md5) > 10:
            yield [L, 'cksum', fix_md5(md5), path]
        else:
            yield from gen_show_cksum(path)


def gen_links(files, out):
    yield ['/bin/rm', '-rf', out]
    yield ['/bin/mkdir', '-p', out]

    for x in files:
        yield ['/bin/ln', x, os.path.join(out, os.path.basename(x))]


def gen_link(fr, to):
    out = os.path.dirname(to)

    yield ['/bin/rm', '-rf', out]
    yield ['/bin/mkdir', '-p', out]
    yield ['/bin/ln', fr, to]


def gen_cksum(fr, to, md5):
    yield [L, 'cksum', fix_md5(md5), fr]
    yield from gen_link(fr, to)


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

        return [sb.cmd(x) for x in gen_cksum(fr, to, md5)]

    def link(self, sb, files, out):
        return [sb.cmd(x) for x in gen_links(files, out)]

    def fix(self, sb, node):
        if 'predict' in node:
            node = cu.copy_dict(node)
            cmds = node['cmd']

            for p in node['predict']:
                if 'sem:' in p['sum']:
                    continue

                cmds.append(sb.cmd([L, 'cksum', p['sum'], p['path']]))

        return node
