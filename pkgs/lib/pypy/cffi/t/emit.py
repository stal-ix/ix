"""Emit a cffi module's C source instead of compiling it to a .so.

The build scripts in lib_pypy end in ffi.compile(), which produces a
shared object. Nothing can dlopen one here, so the module is compiled
into the interpreter instead and its C is all that is wanted. cffi
already knows how to hand that over: emit_c_code() writes the same
source compile() would have built, with both entry points in it --
PyInit_<name> and, under #ifdef PYPY_VERSION, _cffi_pypyinit_<name>.

So: watch set_source() for the FFI objects a script builds, turn
compile() into a no-op so a script that probes by compiling still
reaches the end, and write out the one that was asked for.

set_source() also carries the rest of what the module needs to build:
extra C files and include directories. Those go into a sidecar file
rather than being spelled out again in the recipe, so a module that
changes what it vendors does not need the recipe changed with it.
"""

import os
import runpy
import sys

script = os.path.abspath(sys.argv[1])
wanted = sys.argv[2]
output = os.path.abspath(sys.argv[3])

# the build scripts read neighbouring headers and sources by relative path
here = os.path.dirname(script)
os.chdir(here)
sys.path.insert(0, here)

import cffi

built = {}
set_source = cffi.FFI.set_source


def capture(self, module_name, *args, **kwargs):
    built[module_name] = self
    return set_source(self, module_name, *args, **kwargs)


def no_compile(self, *args, **kwargs):
    # a script may compile to find out which library links, and then
    # carry on with the answer; the first option is as good as any here
    return ''


cffi.FFI.set_source = capture
cffi.FFI.compile = no_compile

sys.argv = [script]
runpy.run_path(script, run_name='__main__')

if wanted not in built:
    raise SystemExit('%s built %s, not %s' % (
        script, sorted(built) or 'nothing', wanted))

ffi = built[wanted]
ffi.emit_c_code(output + '.c')

_, _, _, kwargs = ffi._assigned_source

with open(output + '.deps', 'w') as deps:
    for path in kwargs.get('sources', ()):
        deps.write('SOURCE %s\n' % (os.path.join(here, path),))

    # the script's own directory first: a module that vendors C puts
    # the headers in a subdirectory and includes them by that path --
    # _sha3 says "kcp/KeccakHash.h", _blake2 says "impl/blake2.h" --
    # while set_source names the subdirectory itself
    deps.write('INCLUDE %s\n' % (here,))

    for path in kwargs.get('include_dirs', ()):
        deps.write('INCLUDE %s\n' % (os.path.join(here, path),))

print('emitted %s from %s' % (wanted, script))
