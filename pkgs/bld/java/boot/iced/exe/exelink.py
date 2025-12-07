#!/usr/bin/env python3

import os
import sys
import subprocess

G = frozenset([
    'gamma',
    'apt',
    'extcheck',
    'idlj',
    'jar',
    'jarsigner',
    'java',
    'java-rmi.cgi',
    'javac',
    'javadoc',
    'javah',
    'javap',
    'jcmd',
    'jconsole',
    'jdb',
    'jhat',
    'jinfo',
    'jmap',
    'jps',
    'jrunscript',
    'jsadebugd',
    'jstack',
    'jstat',
    'jstatd',
    'keytool',
    'native2ascii',
    'orbd',
    'pack200',
    'rmic',
    'rmid',
    'rmiregistry',
    'schemagen',
    'serialver',
    'servertool',
    'tnameserv',
    'unpack200',
    'wsgen',
    'wsimport',
    'xjc',
])

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

args = sys.argv[1:]
args = [args[0], '-L' + lib] + list(it_libs()) + args[1:]

while '-Xlinker' in args:
    p = args.index('-Xlinker')
    args = args[:p] + ['-Wl,' + args[p + 1]] + args[p + 2:]

if '-o' in args:
    if os.path.basename(args[args.index('-o') + 1]) in G:
        args = args + list(os.environ['PLUGINS'].split(':'))

def flt_args(cmd):
    for x in cmd:
        if x.startswith('-Wl,-version-script='):
            pass
        else:
            yield x

subprocess.check_call(list(flt_args(args)))
