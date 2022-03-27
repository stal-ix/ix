import json
import subprocess


def run_cmd(cmd, input=''):
    cmd = ['/bin/sudo', '/bin/su', '-s', '/bin/mix', '-', 'mix'] + cmd

    subprocess.run(cmd, shell=False, input=input.encode(), check=True)


class Ops:
    def execute_graph(self, graph):
        run_cmd(['execute'], input=json.dumps(graph))

    def gc(self):
        run_cmd(['gc'])
