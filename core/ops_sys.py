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

    def respawn(self):
        return ['/bin/ix']

    def runpy(self, args):
        return self.respawn() + ['misc', 'runpy'] + args

    def extract(self):
        return ['/bin/bsdtar', 'xf']
