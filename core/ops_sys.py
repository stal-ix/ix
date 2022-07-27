import os
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


class Ops:
    def execute_graph(self, graph):
        run_cmd(['/bin/assemble', 'execute'], input=json.dumps(graph))

    def gc(self):
        run_cmd(['/bin/ix', 'gc'])

    def runpy(self, args):
        return ['/bin/ix', 'misc', 'runpy'] + args

    def extract(self):
        return ['/bin/bsdtar', 'xf']

    def fetch(self, sb, url, path):
        odir = os.path.dirname(path)
        name = os.path.basename(url)

        cmd = [
            '/bin/liner', 'rmrf', odir,
            '/bin/liner', 'mkdir', odir,
            '/bin/liner', 'setpwd', odir,
            '/bin/curl', '-k', '-L', '-o', name, url,
        ]

        return sb.build_cmd_script(cmd, '', {})

    def cksum(self, sb, fr, to, md5):
        if ':' in md5:
            md5 = md5[md5.index(':') + 1:]

        odir = os.path.dirname(to)

        cmd = [
            '/bin/liner', 'cksum', md5, fr,
            '/bin/liner', 'rmrf', odir,
            '/bin/liner', 'mkdir', odir,
            '/bin/liner', 'link', fr, to,
        ]

        return sb.build_cmd_script(cmd, '', {})
