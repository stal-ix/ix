#!/usr/bin/env python3

import sys
import subprocess

subprocess.check_call(['pkg-config-bin'] + sys.argv[1:])
