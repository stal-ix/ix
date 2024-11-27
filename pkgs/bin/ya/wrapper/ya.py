#!/usr/bin/env python3

import os
import sys
import shutil

def which(x):
    if p := shutil.which(x):
        return p

    raise Exception(f'no {x} in PATH')

def it_extra_d(args):
    yield 'USE_PREBUILT_TOOLS', 'no'
    yield 'OPENSOURCE', 'yes'
    yield 'DISABLE_YMAKE_CONF_CUSTOMIZATION', 'yes'
    yield 'OS_SDK', 'local'
    yield 'BUILD_PYTHON3_BIN', sys.executable
    yield 'BUILD_PYTHON_BIN', sys.executable
    yield 'USE_ARCADIA_PYTHON', 'yes'
    yield 'USE_PYTHON3', 'yes'
    yield 'OBJCOPY_TOOL', which('llvm-objcopy')
    yield 'OBJDUMP_TOOL', which('llvm-objdump')
    yield 'STRIP_TOOL', which('llvm-strip')

    if '--musl' in args:
        yield 'MUSL', 'yes'

def it_flags(args):
    for k, v in it_extra_d(args):
        yield f'-D{k}={v}'
        yield f'--host-platform-flag={k}={v}'

    yield '--no-ya-bin-resource'
    yield '--no-yt-store'
    yield '--cxx-compiler=' + which('clang++')
    yield '--c-compiler=' + which('clang')
    yield '--ymake-bin=' + which('ymake')

env = os.environ.copy()

env['YA_TC'] = 'no'
env['YA_NO_RESPAWN'] = '1'
env['YA_CACHE_DIR'] = env['TMPDIR'] + '/yac'

def preproc_make(args):
    return list(it_flags(args)) + args

def preproc(args):
    if args and args[0] in ('make', 'm', 'cake', 'bake'):
        return ['make'] + preproc_make(args[1:])

    return args

os.execvpe('ya-bin', ['ya-bin'] + list(preproc(sys.argv[1:])), env)
