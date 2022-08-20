import os
import sys
import json
import subprocess

import core.utils as cu
import core.error as ce


B = '/bin/bin_ix'


def run_cmd(cmd, input=''):
    cmd = [
        '/bin/chrt', '-i', '0',
        '/bin/nice', '-n', '20',
        '/bin/su', '-s',
        cmd[0], '-', 'ix'
    ] + cmd[1:]

    if os.getuid():
        cmd = ['/bin/sudo'] + cmd

    try:
        subprocess.run(cmd, shell=False, input=input.encode(), check=True)
    except Exception as e:
        raise ce.Error(' '.join(cmd) + ' failed', exception=e)


def gen_show_cksum(path):
    yield ['/bin/sha256sum', path]
    yield ['/bin/false']


def gen_dir(out):
    yield ['/bin/rm', '-rf', out]
    yield ['/bin/mkdir', '-p', out]


def split_cksum(cksum):
    if ':' in cksum:
        return cksum.split(':')

    return 'sha', cksum


def gen_one_sum(path, cksum):
    yield ['/bin/echo', cksum]

    f, s = split_cksum(cksum)

    if f == 'sem':
        return

    f = {'sha': 'sha256'}.get(f, f)

    prog = f'/bin/{f}sum'

    yield [prog, path]

    yield {
        'args': [prog, '-cw', '-'],
        'stdin': f'{s}  {path}\n',
        'env': {},
    }


def gen_cksum(fr, to, md5):
    if len(md5) < 16:
        yield from gen_show_cksum(fr)
    else:
        yield from gen_one_sum(fr, md5)

        if to:
            yield from gen_link(fr, to)


def gen_fetch(url, path, md5):
    yield from gen_dir(os.path.dirname(path))
    yield [f'{B}/curl', '-k', '-L', '-o', path, url]
    yield from gen_cksum(path, '', md5)


def gen_links(files, out):
    yield from gen_dir(out)

    for x in files:
        yield ['/bin/ln', x, os.path.join(out, os.path.basename(x))]


def gen_link(fr, to):
    yield from gen_dir(os.path.dirname(to))
    yield ['/bin/ln', fr, to]


def gen_predict_checks(pred):
    for p in pred:
        yield from gen_one_sum(p['path'], p['sum'])


def add_checks(sb, node):
    node['cmd'].extend(sb.cmds(gen_predict_checks(node['predict'])))

    return node


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
        return sb.cmds(gen_fetch(url, path, md5))

    def cksum(self, sb, fr, to, md5):
        return sb.cmds(gen_cksum(fr, to, md5))

    def link(self, sb, files, out):
        return sb.cmds(gen_links(files, out))

    def fix(self, sb, node):
        if 'predict' in node:
            return add_checks(sb, cu.copy_dict(node))

        return node
