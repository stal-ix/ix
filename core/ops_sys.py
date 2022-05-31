import json
import subprocess

import core.error as ce


def run_cmd(cmd, input=''):
    cmd = [
        '/bin/sudo',
        '/bin/chrt', '-i', '0',
        '/bin/nice', '-n', '20',
        '/bin/su', '-s',
        '/bin/ix', '-', 'ix'
    ] + cmd

    try:
        subprocess.run(cmd, shell=False, input=input.encode(), check=True)
    except Exception as e:
        if '1' in str(e):
            raise ce.Error('shit happen', exception=e, visible=False)

        raise e

class Ops:
    def execute_graph(self, graph):
        run_cmd(['execute'], input=json.dumps(graph))

    def gc(self):
        run_cmd(['gc'])

    def respawn(self):
        return ['/bin/ix']
