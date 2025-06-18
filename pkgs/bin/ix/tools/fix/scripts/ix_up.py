#!/usr/bin/env python3

import os
import sys
import json
import time
import subprocess

sys.stdout = sys.stderr

GOOD = frozenset('0123456789abcdef')

sent = '1' * 64

go_latest = 24

go_tool = '''
{% block go_tool %}
bin/go/lang/{go_latest}
{% endblock %}
'''.replace('{go_latest}', str(go_latest))

cargo_latest = 86

cargo_tool = '''
{% block cargo_tool %}
bld/cargo/{cargo_latest}
{% endblock %}
'''.replace('{cargo_latest}', str(cargo_latest))

def call1(*cmd):
    print(f'run {cmd}')
    return subprocess.check_output(list(cmd), stdin=None)

def call_eat(*cmd):
    print(f'run {cmd}')
    return subprocess.check_output(list(cmd), stdin=None, stderr=subprocess.STDOUT)

def call(*cmd):
    try:
        return call_eat(*cmd)
    except Exception as e:
        return e.stdout

def run(*cmd):
    print(f'run {cmd}')
    return subprocess.check_call(list(cmd), stdin=None)

def is_sha(x):
    if len(x) != 64:
        return False

    for ch in x:
        if ch not in GOOD:
            return False

    return True

def parse_sha(data):
    for l in data.split('\n'):
        for x in l.split(' '):
            if is_sha(x):
                return x

    raise Exception('no sha')

def subst_sha(data, to):
    return data.replace(parse_sha(data), to)

def fix1(pn):
    nd = subst_sha(data, sent)

    if nd:
        if 'cargo_url' in nd:
            if 'cargo_tool' not in nd:
                nd += cargo_tool

            for ver in range(75, cargo_latest):
                nd = nd.replace(f'bld/cargo/{ver}', f'bld/cargo/{cargo_latest}')
        elif 'go_url' in nd:
            if 'go_tool' not in nd:
                nd += go_tool

            for ver in range(21, go_latest):
                nd = nd.replace(f'bin/go/lang/{ver}', f'bin/go/lang/{go_latest}')

        with open(pn, 'w') as f:
            f.write(nd)

        return 1

    return 0

def fix2(pn, sha):
    with open(pn) as f:
        data = f.read()

    nd = data.replace(sent, sha)

    with open(pn, 'w') as f:
        f.write(nd)

def it_files(pkgs):
    for p in pkgs:
        for x in call1('./ix', 'dep', p).decode().split('\n'):
            if x.strip():
                yield x.strip()

def revstr(s):
    return ''.join(reversed(s))

def flt_pkgs(pkgs):
    for x in pkgs:
        yield x.removesuffix('/unwrap')

def process(pkgs):
    files = list(sorted(frozenset(it_files(pkgs))))

    bld_pkgs = list(flt_pkgs(pkgs))

    fixed = sum((fix1('pkgs/' + f) for f in files), 0)

    if fixed != 1:
        print(f'nothing to do, fixed {fixed}')

        return 1

    run('git', 'diff')

    out = call('./ix', 'build', *bld_pkgs).decode()
    sha = revstr(parse_sha(revstr(out.replace(sent, ''))))

    for f in files:
        print(f'fix {f}')
        fix2('pkgs/' + f, sha)

    run('git', 'diff')
    call_eat('./ix', 'build', *bld_pkgs)

    return 0

sys.exit(process(sys.argv[1:]))
