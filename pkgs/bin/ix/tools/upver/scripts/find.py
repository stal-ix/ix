#!/usr/bin/env python3

import os

for a, b, c in os.walk('.'):
    for x in c:
        pp = os.path.join(a, x)

        if '.sh' in pp:
            with open(pp) as f:
                data = f.read()

            if '://' in data:
                if 'pkg_name' not in data:
                    if 'git_commit' not in data:
                        print(pp)
