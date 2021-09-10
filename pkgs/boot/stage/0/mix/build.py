import os

out = os.environ['out']
src = os.environ['src']

os.chdir(out)

for x in os.listdir(src):
    p = os.path.join(src, x)

    if 'tar.gz' in p:
        mix.untar(p)

envp = os.path.join(out, 'env')

try:
    with open(envp + '.template', 'r') as f:
        data = f.read()
except FileNotFoundError:
    data = '''
export CLANG_VERSION=13.0.0
export CPPFLAGS="-isystem :prefix:/lib/clang/$CLANG_VERSION/include $CPPFLAGS"
'''.strip()

with open(envp, 'w') as f:
    f.write(data.replace(':prefix:', out))
