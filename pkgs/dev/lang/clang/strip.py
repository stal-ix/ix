import os
import io
import sys
import tarfile


def walk(d):
    for a, b, c in os.walk(d):
        for x in c + b:
            yield os.path.join(a[len(d) + 1:], x)


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


def use_file(f):
    if f.startswith('lib/clang'):
        return True

    if f.startswith('bin/'):
        n = os.path.basename(f)

        if n in IN_USE:
            return True

        if n.startswith('ld'):
            return True

        if n.startswith('lld'):
            return True

    return False


out = os.environ['out']


for f in reversed(sorted(walk(out))):
    print(f, use_file(f))

    if not use_file(f):
        p = os.path.join(out, f)

        try:
            os.unlink(p)
        except OSError:
            try:
                os.rmdir(p)
            except OSError:
                pass
