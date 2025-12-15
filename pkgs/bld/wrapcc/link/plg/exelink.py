import os
import sys
import subprocess

# for bld/ruby
if 'conftest' not in str(sys.argv):
    print(f'EXELINK {sys.argv}', file=sys.stderr)

lib = os.environ['tmp'] + '/lib'

def it_libs():
    try:
        for x in os.listdir(lib):
            if '.a' in x:
                yield lib + '/' + x
    except FileNotFoundError:
        pass

def it_bins():
    for x in P.split(';'):
        x = x.strip()

        if x:
            yield x

args = sys.argv[1:] + ['-L' + lib] + list(it_libs())

def need_plugins():
    for x in it_bins():
        if x in args:
            return True

def it_plugins():
    if x := os.environ.get('PLUGIN'):
        yield x

    if x := os.environ.get('PLUGINS'):
        for y in x.split(':'):
            y = y.strip()

            if y:
                yield y

if need_plugins():
    args = args + list(it_plugins())

subprocess.check_call(args)
