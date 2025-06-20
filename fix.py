import os
import sys

def fixl(l):
    if 'block install' in l:
        return '{% block go_bins %}'

    if 'mkdir ${' in l:
        return ''

    if 'cp ' in l:
        return l.split(' ')[1]

    return l

def fix(data):
    if 'cargo_sha' in data:
        return

    if 'go_sha' not in data:
        return

    if 'block install' not in data:
        return

    if 'mkdir ${' not in data:
        return

    if 'cp ' not in data:
        return

    return '\n'.join(fixl(l) for l in data.split('\n')).strip().replace('bins %}\n', 'bins %}') + '\n'

for a, b, c in os.walk('.'):
    for x in c:
        if 'ix.sh' in x:
            p = os.path.join(a, x)

            with open(p) as f:
                data = f.read()

            if ndata := fix(data):
                if data != ndata:
                    with open(p, 'w') as f:
                        f.write(ndata)
