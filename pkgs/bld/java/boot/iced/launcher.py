import os
import sys
import json
import subprocess

def split(v):
    for x in v.split():
        x = x.strip()

        if x:
            yield x

def java_home():
    if 'JAVA_HOME' in os.environ:
        return os.environ('JAVA_HOME')

    return os.path.dirname(os.path.dirname(os.path.abspath(sys.argv[0])))

def execute(cmd, args):
    _, name, klass, extra = cmd[:4]
    args = list(split(extra)) + args
    jh = java_home()
    vm = ['-classpath', f'{jh}/lib/tools.jar:{jh}/lib/jconsole.jar']
    cl = []

    for x in args:
        if x.startswith('-J'):
            vm.append(x[2:])
        else:
            cl.append(x)

    env = os.environ.copy()
    env['JAVA_HOME'] = jh
    cmd = ['hotspot'] + vm + [klass] + cl
    try:
        subprocess.check_call(cmd, env=env)
    except Exception as e:
        print(f'{cmd} -> {e}', file=sys.stderr)

        raise e

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
