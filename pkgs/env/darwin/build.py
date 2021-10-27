import os


out = os.environ['out']
sdk = '/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk'

data = r'''
export MACOSX_DEPLOYMENT_TARGET=11.0
export OSX_SDK="{sdk}"
export CPPFLAGS="--sysroot $OSX_SDK -isystem$OSX_SDK/usr/include -F$OSX_SDK $CPPFLAGS"
export LDFLAGS="--sysroot $OSX_SDK -L$OSX_SDK/usr/lib -F$OSX_SDK -Wl,-platform_version -Wl,macos -Wl,$MACOSX_DEPLOYMENT_TARGET -Wl,$MACOSX_DEPLOYMENT_TARGET $LDFLAGS"
'''.format(sdk=out)

os.chdir(out)

with open('env', 'w') as f:
    f.write(data)

os.symlink(sdk + '/System', 'System')
os.makedirs('usr/lib')
os.symlink(sdk + '/usr/include', 'usr/include')

libs = (
    'libSystem.B.tbd',
    'libSystem.tbd',
    'libc.tbd',
    'libdl.tbd',
    'libm.tbd',
    'libpthread.tbd',
    'libobjc.A.tbd',
    'libobjc.tbd',
    'libresolv.tbd',
    'libutil.tbd',
)

for x in libs:
    os.symlink(sdk + '/usr/lib/' + x, 'usr/lib/' + x)
