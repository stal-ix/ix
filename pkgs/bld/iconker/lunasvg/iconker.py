#!/usr/bin/env python3

import os
import sys
import shutil
import functools
import subprocess

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

    @functools.cache
    def f():
        subprocess.check_call(['svg2png', svg, f'192x192'])

        return os.path.basename(svg) + '.png'

    for w in (16, 24, 32, 48, 64):
        out = f'{to}/{w}x{w}/{png}'

        os.makedirs(os.path.dirname(out), exist_ok=True)

        if os.path.exists(out):
            print(f'skip {out}', file=sys.stderr)
        else:
            subprocess.check_call(['convert', f(), '-resize', f'{w}x{w}', out])
