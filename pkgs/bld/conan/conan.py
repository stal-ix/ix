#!/usr/bin/env python3

import os
import sys
import fnmatch
import configparser

if '--version' in sys.argv:
    print('2.0.0')
    sys.exit(0)

def parse_cf(data):
    prog = []
    cfg = configparser.ConfigParser(allow_no_value=True, delimiters=('->',))
    cfg.read_string(data)
    imp = cfg['imports']

    for k in imp:
        kk = [x.strip() for x in k.split(',')]

        prog.append({
            'kind': kk[0],
            'glob': kk[1],
            'path': imp[k],
        })

    return prog

def all_bins():
    for p in os.environ['PATH'].split(':'):
        if os.path.isdir(p):
            for x in os.listdir(p):
                yield p + '/' + x

def match(prog, b):
    for p in prog:
        if p['kind'] == 'bin':
            if fnmatch.fnmatch(os.path.basename(b), p['glob']):
                yield p

def find_bins(prog):
    for b in all_bins():
        for m in match(prog, b):
            yield m, b

def install(args):
    cf = args[0] + '/conanfile.txt'
    out = args[args.index('--install-folder') + 1]
    prog = parse_cf(open(cf).read())

    for m, b in find_bins(prog):
        where = os.path.normpath(os.path.join(out, m['path']))

        print(f'conan: symlink {b} into {where}')

        try:
            os.makedirs(where)
        except Exception:
            pass

        os.symlink(b, os.path.join(where, os.path.basename(b)))

globals()[sys.argv[1]](sys.argv[2:])
