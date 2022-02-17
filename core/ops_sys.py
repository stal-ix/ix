import json
import subprocess


def run_cmd(cmd, input=''):
    cmd = ['/bin/doas', 'mix', '-T', '/bin/mix'] + cmd
    env = {'DROPBEAR_PASSWORD': ''}

    subprocess.run(cmd, shell=False, input=input.encode(), check=True, env=env)


class Ops:
    def execute_graph(self, graph):
        run_cmd(['execute'], input=json.dumps(graph))

    def gc(self):
        run_cmd(['gc'])
