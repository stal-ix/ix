#!/usr/bin/env python3

import os
import sys

for a, b, c in os.walk(sys.argv[1]):
    for d in c:
        path = os.path.join(a, d)

        if os.path.islink(path):
            continue

        with open(path, 'rb') as f:
            data = f.read(4)

            if len(data) < 4:
                pass
            else:
                if data[0] == 0x7f and data[1] == 0x45 and data[2] == 0x4c and data[3] == 0x46:
                    print(f'binary shit in {path}')
                    os.unlink(path)
