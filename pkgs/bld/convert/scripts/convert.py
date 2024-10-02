#!/usr/bin/env python3

import os
import sys
import atexit
import hashlib
import subprocess

a = sys.argv[:]
n = hashlib.md5(str(sys.argv).encode()).hexdigest() + '.png'

if '.svg' in a[-2]:
    subprocess.check_call(['render_icon', a[-2], n])
    a[-2] = n

subprocess.check_call(['magick', 'convert'] + a[1:])
