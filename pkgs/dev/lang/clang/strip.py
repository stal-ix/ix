import os


IN_USE = frozenset([
    'clang',
    'clang++',
    'clang-13',
    'clang-cpp',
    'dsymutil',
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
])


def use_file(n):
    if n in IN_USE:
        return True

    if n.startswith('ld'):
        return True

    if n.startswith('lld'):
        return True

    return False


bin = os.path.join(os.environ['out'], 'bin')


for f in os.listdir(bin):
    if use_file(f):
        print(f'use {f}')

        continue

    p = os.path.join(bin, f)

    print(f'unlink {p}')

    try:
        os.unlink(p)
    except Exception:
        pass
