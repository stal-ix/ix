import os
import sys
import json
import subprocess

def split(v):
    for x in v.split():
        x = x.strip()

        if x:
            yield x

def execute(cmd, args):
    _, name, klass, extra = cmd[:4]
    jh = os.path.dirname(os.path.dirname(os.path.abspath(sys.argv[0])))

    cmd = [
        'java',
        '-cp', f'{jh}/lib/tools.jar:{jh}/lib/jconsole.jar',
    ] + [klass] + list(split(extra)) + args

    subprocess.check_call(cmd)

D = json.loads(D)
P = dict((x[1], x) for x in D)
H = os.path.basename(sys.argv[0])

if H == 'launcher' and sys.argv[1] == 'install':
    for x in P.keys():
        to = sys.argv[2] + '/' + x

        try:
            os.unlink(to)
        except Exception as e:
            pass

        os.symlink('launcher', to)
else:
    execute(P[H], sys.argv[1:])
