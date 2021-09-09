import os


os.chdir(os.environ['out'])
os.makedirs('bin')
os.chdir('bin')


F = (
    ('/usr/bin/ld', 'ld'),
    ('/usr/bin/dash', 'dash'),
    ('/usr/bin/gcc', 'clang'),
    ('/usr/bin/g++', 'clang++'),
    ('/usr/bin/cpp', 'clang-cpp'),
    ('/usr/bin/ar', 'llvm-ar'),
    ('/usr/bin/ranlib', 'llvm-ranlib'),
    ('/usr/bin/nm', 'llvm-nm'),
    ('/usr/bin/strip', 'llvm-strip'),
    ('/usr/bin/as', 'as'),
)

for f, bn in F:
    os.symlink(f, bn)
