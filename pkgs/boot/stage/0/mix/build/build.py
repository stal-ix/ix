import os
import tarfile


os.chdir(os.environ['out'])
os.makedirs('bin')
os.chdir('bin')


def walk(d):
    for a, b, c in os.walk(d):
        for x in c:
            yield os.path.join(a[len(d) + 1:], x)


def iter_files():
    for p in reversed(os.environ['PATH'].split(':')):
        if ('-dash-minimal/' in p) or ('-clang/' in p):
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


with tarfile.open('bootstrap-{{mix.platform.target.os}}-{{mix.platform.target.arch}}.tar.gz', 'w|gz') as tar:
    for p, n in iter_files():
        print('add', p, n)
        tar.add(p, n)
