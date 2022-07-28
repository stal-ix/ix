import os
import sys
import json
import subprocess

import core.error as ce


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
    name = os.path.basename(url)

    yield [
        '/bin/liner', 'rmrf', odir,
        '/bin/liner', 'mkdir', odir,
        '/bin/curl', '-k', '-L', '-o', path, url,
    ]

    if len(md5) > 10 and 'sem:' not in md5:
        yield [
            '/bin/liner', 'cksum', fix_md5(md5), path,
        ]


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg

    def execute_graph(self, graph):
        run_cmd(['/bin/assemble', 'execute'], input=json.dumps(graph))

    def gc(self):
        run_cmd([sys.executable, self.cfg.binary, 'gc'])

    def runpy(self, args):
        return ['/bin/ix_python', '-'] + args

    def extract(self):
        return ['/bin/bsdtar', 'xf']

    def fetch(self, sb, url, path, md5):
        return [sb.build_cmd_script(x, '', {}) for x in gen_fetch(url, path, md5)]

    def cksum(self, sb, fr, to, md5):
        odir = os.path.dirname(to)

        cmd = [
            '/bin/liner', 'cksum', fix_md5(md5), fr,
            '/bin/liner', 'rmrf', odir,
            '/bin/liner', 'mkdir', odir,
            '/bin/liner', 'link', fr, to,
        ]

        return sb.build_cmd_script(cmd, '', {})

    def link(self, sb, files, out):
        def it():
            yield from ('/bin/liner', 'rmrf', out)
            yield from ('/bin/liner', 'mkdir', out)

            for x in files:
                yield from ('/bin/liner', 'link', x, os.path.join(out, os.path.basename(x)))

        return sb.build_cmd_script(list(it()), '', {})
