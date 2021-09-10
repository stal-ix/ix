import sys

show = True

for l in sys.stdin:
    l = l.strip()

    if 'tkinter' in l:
        show = False

    if 'binasc' in l:
        show = True

    if not l:
        continue

    if l[0] != '#':
        print(l)

        continue

    if len(l) > 1 and l[1] == ' ':
        continue

    if 'SSL' in l:
        continue

    if '#*' in l:
        continue

    if '\\' in l:
        continue

    if show:
        print(l[1:])
