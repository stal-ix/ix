import json
import subprocess


def run_cmd(cmd, input=''):
    cmd = [
        '/bin/sudo',
        '/bin/chrt', '-i', '0',
        '/bin/nice', '-n', '20',
        '/bin/su', '-s', '/bin/ix', '-', 'ix'
    ] + cmd

    subprocess.run(cmd, shell=False, input=input.encode(), check=True)


class Ops:
    def execute_graph(self, graph):
        run_cmd(['execute'], input=json.dumps(graph))

    def gc(self):
        run_cmd(['gc'])
