import os
import json
import base64
import subprocess


meta = json.loads(base64.b64decode("{{meta}}").decode())
path = os.environ['out']


os.makedirs(path)
os.chdir(path)


def iter_dir_1(w):
    for a, b, c in os.walk(w):
        for x in c:
            yield os.path.join(a, x)

        for x in b:
            dl = os.path.join(a, x)

            if os.path.islink(dl):
                yield dl


def iter_dir(w):
    for x in iter_dir_1(w):
        yield x[len(w) + 1:]


def install(fr, to):
    for x in iter_dir(fr):
        if '/' not in x:
            continue

        # print(f'{fr} {x} {to}')
        p = os.path.join(to, x)

        try:
            os.makedirs(os.path.dirname(p))
        except Exception:
            pass

        try:
            os.unlink(p)
        except FileNotFoundError:
            pass

        pf = os.path.join(fr, x)
        # print(f'symlink {pf} -> {p}')
        os.symlink(pf, p)


for p in reversed(meta['links']):
    install(p, path)


SH = '''
set -xue

if test -d fix; then
    find fix/ -name '*.sh' | while read l; do
        sh "${l}" || exit 1
    done

    rm -r fix
fi
'''


subprocess.run(['sh'], check=True, input=SH.encode())


with open('meta.json', 'w') as f:
    f.write(json.dumps(meta, indent=4, sort_keys=True))
