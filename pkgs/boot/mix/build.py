import os
import io
import sys
import tarfile


os.chdir(os.environ['out'])
os.makedirs('bin')
os.chdir('bin')


def walk(d):
    for a, b, c in os.walk(d):
        for x in c:
            yield os.path.join(a[len(d) + 1:], x)


IN_USE = frozenset(
    [
        'dash',
        'clang',
        'clang++',
        'clang-13',
        'clang-cpp',
        'llvm-ar',
        'llvm-as',
        'llvm-nm',
        'llvm-objcopy',
        'llvm-objdump',
        'llvm-install-name-tool',
        'llvm-libtool-darwin',
        'llvm-lipo',
        'llvm-otool',
        'llvm-ranlib',
        'llvm-strip',
        'env.template',
    ]
)


def use_file(f):
    if not f.startswith('bin/'):
        return True

    n = os.path.basename(f)

    if n in IN_USE:
        return True

    if n.startswith('ld'):
        return True

    if n.startswith('lld'):
        return True

    return False


data = f'''
export CLANG_VERSION={sys.argv[2]}
export CPPFLAGS="-isystem :prefix:/lib/clang/$CLANG_VERSION/include $CPPFLAGS"
'''.strip()


def iter_files():
    env = 'env.template'

    with open(env, 'w') as f:
        f.write(data)

    yield env, env

    for p in reversed(os.environ['PATH'].split(':')):
        if ('-dash-minimal/' in p) or ('-lang-clang/' in p):
            base = os.path.dirname(p)

            print(base)

            if os.path.isdir(base + '/lib/clang'):
                for f in walk(base + '/lib/clang'):
                    yield base + '/lib/clang/' + f, 'lib/clang/' + f

            if os.path.isdir(base + '/bin'):
                for x in os.listdir(base + '/bin'):
                    f = base + '/bin/' + x

                    if os.path.isfile(f):
                        yield f, 'bin/' + x


with tarfile.open(sys.argv[1], 'w|gz') as tar:
    for p, n in sorted(iter_files(), key=lambda x: x[1]):
        if use_file(n):
            print('add', p, n)

            tar.add(p, n)
        else:
            print('skip', p, n)
