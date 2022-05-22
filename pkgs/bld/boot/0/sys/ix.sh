{% extends '//die/py.py' %}

{% block ind_deps %}
bld/boot/0/sys/env
{% endblock %}

{% block script_body %}
import os
import subprocess

def run(*args):
    return subprocess.check_output(list(args)).decode().strip()

out = os.environ['out']
bin = os.path.join(out, 'bin')

os.makedirs(bin)

print(f'into {os.getcwd()}')

os.chdir(bin)

def which(paths, b):
    for p in paths:
        pp = os.path.join(p, b)

        print(f'try {pp} for {b}')

        if os.path.isfile(pp):
            return pp

def wsys(b):
    return which(['/bin', '/usr/bin', '/usr/local/bin', '/ix/realm/boot/bin'], b)

def wloc(bins):
    for b in bins:
        if r := which([bin], b):
            return b

    raise Exception(f'can not found one of {bins} in {out}')

SHELLS = ['yash', 'dash', 'bash']

TOOLS = SHELLS + [
    'ld',
    'gcc', 'g++', 'cpp', 'c++',
    'clang', 'clang++', 'clang-cpp',
    'ar', 'ranlib', 'nm', 'strip', 'as',
    'llvm-ar', 'llvm-ranlib', 'llvm-nm', 'llvm-strip', 'llvm-as',
]

def sl(f, t):
    print(f'symlink {f} into {t}')
    assert os.path.isfile(f)
    os.symlink(f, t)

for x in TOOLS:
    if r := wsys(x):
        sl(r, x)

        if x == 'g++' and 'clang' not in run(r, '--version'):
            for tool in ('cc1plus', 'collect2', 'cc1'):
                cc = run(r, f'--print-prog-name={tool}')

                assert os.path.basename(cc) == tool

                sl(cc, tool)


sl(wloc(SHELLS), 'sh')

with open(os.path.join(out, 'env'), 'w') as f:
    f.write('export PATH=_/bin:${PATH}\n'.replace('_', out))
{% endblock %}
