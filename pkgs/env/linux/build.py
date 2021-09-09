import os


out = os.environ['out']

data = r'''
export CPPFLAGS="-isystem {sdk}/include $CPPFLAGS"
export CFLAGS="-fPIC $CFLAGS"
export LDFLAGS="-L{sdk}/lib $LDFLAGS"
'''.format(sdk=out)

os.chdir(out)

with open('env', 'w') as f:
    f.write(data)

os.symlink('/usr/include', 'include')
os.symlink('/lib/x86_64-linux-gnu', 'lib')
