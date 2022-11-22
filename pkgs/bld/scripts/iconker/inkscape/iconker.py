#!/usr/bin/env python3

import os
import sys

fr = sys.argv[1]
to = sys.argv[2]

def it_svg(pp):
    for a, b, c in os.walk(fr):
        for x in c:
            if '.svg' not in x:
                continue

            p = os.path.join(a, x)

            yield p, p[len(pp) + 1:]

for svg, name in it_svg(fr):
    png = name.replace('.svg', '.png')

    for w in (16, 24, 32, 48, 64):
        out = f'{to}/{w}x{w}/{png}'

        os.makedirs(os.path.dirname(out), exist_ok=True)

        prog = f'''
file-open:{svg}
export-type:png
export-filename:{out}
export-width:{w}
export-do
'''

        print(prog)
