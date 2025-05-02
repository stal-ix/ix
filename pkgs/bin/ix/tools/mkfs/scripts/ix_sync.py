#!/usr/bin/env python3

import sys
import json
import subprocess

def gen_folders(p):
    for x in p:
        yield x
        yield from json.loads(open(x + '/meta.json').read())['links']

where = sys.argv[1]
dirs = list(sorted(frozenset(gen_folders(sys.argv[2:]))))

subprocess.check_call(['rsync', '--progress', '-a', '-r', '-R'] + dirs + [where + '/'])
