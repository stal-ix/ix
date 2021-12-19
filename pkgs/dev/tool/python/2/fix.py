import sys

class Skip(Exception):
    pass

for l in sys.stdin.read().split('\n'):
    if not l.strip():
        continue

    if l[0] != '#':
        print(l)

        continue

    if '\\' in l:
        continue

    if '.c' not in l:
        continue

    if l[0] == '#':
        l = l[1:]

    if '#' in l:
        l = l[:l.index('#')]

    if '=' in l:
        continue

    if 'Setup.config' in l:
        continue

    if ':' in l:
        continue

    def it():
        for t in l.split():
            if not t.strip():
                continue

            if t[:2] == '-I':
                continue

            if t[:2] == '-l':
                continue

            if t[:2] == '-L':
                continue

            if t[:2] == '-R':
                raise Skip()

            if t[:1] == '$':
                raise Skip()

            yield t

    try:
        print(' '.join(it()))
    except Skip:
        pass
