{% extends '//mix/template/py.py' %}

{% block build %}
import os

out = os.environ['out']
bin = os.path.join(out, 'bin')

os.makedirs(bin)
os.chdir(bin)

def which(paths, b):
    for p in paths:
        pp = os.path.join(p, b)

        if os.path.isfile(pp):
            return pp

def wsys(b):
    return which(['/bin', '/usr/bin', '/usr/local/bin'], b)

def wloc(bins):
    for b in bins:
        if r := which([os.getcwd()], b):
            return b

    raise Exception(f'can not found one of {bins}')

SHELLS = ['dash', 'bash', 'sh']

TOOLS = SHELLS + [
    'ld',
    'gcc', 'g++', 'cpp',
    'clang', 'clang++',
    'ar', 'ranlib', 'nm', 'strip', 'as',
    'llvm-ar', 'llvm-ranlib', 'llvm-nm', 'llvm-strip', 'llvm-as',
]

for x in TOOLS:
    if r := wsys(x):
        os.symlink(x, os.path.basename(x))

sh = wloc(SHELLS)

if sh != 'dash':
    os.symlink(sh, 'dash')

S = '''
setup_toolchain() {
    export AR="{ar}"
    export NM="{nm}"
    export AS="{as}"
    export CC="{cc}"
    export CXX="{cxx}"
    export STRIP="{strip}"
    export RANLIB="{ranlib}"
}
'''

S = S.replace('{ar}', wloc(['llvm-ar', 'ar']))
S = S.replace('{nm}', wloc(['llvm-nm', 'nm']))
S = S.replace('{as}', wloc(['llvm-as', 'as']))
S = S.replace('{cc}', wloc(['clang', 'gcc']))
S = S.replace('{cxx}', wloc(['clang++', 'g++']))
S = S.replace('{strip}', wloc(['llvm-strip', 'strip']))
S = S.replace('{ranlib}', wloc(['llvm-ranlib', 'ranlib']))

with open(os.path.join(out, 'env'), 'w') as f:
    f.write(SCRIPT)
{% endblock %}
