import os
import sys
import json
import random
import getpass
import subprocess

import core.utils as cu
import core.error as ce


B = '/bin/bin_ix'


def run_cmd(cmd, input='', user='ix'):
    ru = getpass.getuser()

    if ru == user:
        suffix = [cmd[0]]
        prefix = []
    elif ru == 'root':
        suffix = ['/bin/su', '-s', cmd[0], user]
        prefix = []
    elif user == 'root':
        suffix = [cmd[0]]
        prefix = ['/bin/sudo']
    else:
        suffix = ['/bin/su', '-s', cmd[0], user]
        prefix = ['/bin/sudo']

    cmd = prefix + [
        '/bin/flock', '-x', '/ix',
        '/bin/chrt', '-i', '0',
        '/bin/nice', '-n', '20',
    ] + suffix + cmd[1:]

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

    f = {'sha': 'sha256'}.get(f, f)

    prog = f'/bin/{f}sum'

    yield [prog, path]

    yield {
        'args': [prog, '-cw', '-'],
        'stdin': f'{s}  {path}\n',
        'env': {},
    }


def gen_cksum(fr, md5):
    if len(md5) < 16:
        yield from gen_show_cksum(fr)
    else:
        yield from gen_one_sum(fr, md5)


def gen_fetch_curl(url, path, md5):
    yield from gen_dir(os.path.dirname(path))

    yield [
        f'{B}/curl',
        '--retry', '100',
        '--retry-all-errors',
        '--retry-delay', '2',
        '-k', '-L', '-o', path, url,
    ]

    yield from gen_cksum(path, md5)


def gen_mirrors(sb, md5):
    for x in sb.package.manager.mirrors:
        yield os.path.join(x, md5)


def gen_fetch_aria_2(sb, url, path, sha):
    yield from gen_dir(os.path.dirname(path))

    urls = list(gen_mirrors(sb, sha))
    random.Random(sb.config.seed + sha).shuffle(urls)
    urls = urls[:5] + [url]

    yield [
        f'/bin/aria2c',
        f'--checksum=sha-256={sha}',
        '-o', os.path.basename(path),
        '-d', os.path.dirname(path),
        '-s', str(len(urls)),
        '--console-log-level=notice',
        '--async-dns=false',
        '--no-conf=true',
        '--uri-selector=inorder',
        '--check-certificate=false',
    ] + urls


HAVE_ARIA = os.path.isfile('/bin/aria2c')


def gen_fetch(sb, url, path, md5):
    if HAVE_ARIA and md5.startswith('sha:') and len(md5) == 68:
        yield from gen_fetch_aria_2(sb, url, path, md5[4:])
    else:
        yield from gen_fetch_curl(url, path, md5)


def gen_links(files, out):
    yield from gen_dir(out)

    for x in files:
        yield ['/bin/ln', x, os.path.join(out, os.path.basename(x))]


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

    def gc(self, kind):
        run_cmd(['/bin/env', 'IX_EXEC_KIND=local', sys.executable, self.cfg.binary, 'gc'] + kind, user='root')

    def runpy(self):
        return [f'{B}/python', '-']

    def extract(self):
        return [f'{B}/bsdtar', '--no-same-permissions', '--no-same-owner', '-x', '-f']

    def fetch(self, sb, url, path, md5):
        return sb.cmds(gen_fetch(sb, url, path, md5))

    def link(self, sb, files, out):
        return sb.cmds(gen_links(files, out))

    def fix(self, sb, node):
        if 'predict' in node:
            return add_checks(sb, cu.copy_dict(node))

        return node
