import sys


def fix_line(l):
    def it():
        for x in l.split(' '):
            if x[:2] in ('-I', '-D', '-l', '$('):
                pass
            else:
                yield x

    return ' '.join(it())


skip = False


for l in sys.stdin.readlines():
    l = l.strip()

    if not l:
        continue

    if '---' in l:
        skip = not skip

    if l[:2] == '# ':
        continue

    if '\t' in l:
        continue

    if l[:2] == '#*':
        continue

    if l[-1] == '\\':
        continue

    if not skip:
        if l[0] == '#':
            l = fix_line(l[1:])

        p = l.find('#')

        if p > 0:
            l = l[:p]

        l = l.strip()

        if l:
            print(l)
