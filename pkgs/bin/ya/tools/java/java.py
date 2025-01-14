#!/usr/bin/env python3

import os
import sys
import shutil

jar = sys.argv[sys.argv.index('-jar') + 1]
out = sys.argv[sys.argv.index('-o') + 1]
src = jar

for i in range(0, 5):
    src = os.path.dirname(src)

shutil.copytree(src + '/generated', out, dirs_exist_ok=True)
