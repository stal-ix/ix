#!/usr/bin/env python3
"""Plan a CPython build whose stdlib is native code rather than .py.

Walks the stdlib tree, and writes:

  Makefile    one rule per module: Cython to C, then C to an object
  ixmain.c    the entry point, with every module in the inittab

Every module goes into the inittab under its full dotted name. CPython
3.14 looks names up there by exact string compare (Python/import.c,
is_builtin) and BuiltinImporter.find_spec no longer refuses a name just
because an import came with a parent path -- so unlike older versions,
submodules of packages can be built in.

Cython names a module's init function after the last component alone,
so email.message and json.message would both define PyInit_message.
Each object is compiled with that name macro'd to one built from the
full dotted name.
"""

import _imp
import ast
import os
import sys

stdlib, outdir = sys.argv[1], sys.argv[2]

# test suites and the tk demos are not worth compiling; site-packages is
# for things installed later, and config-* holds build artefacts
SKIP = {'test', 'tests', '__pycache__', 'idlelib', 'turtledemo',
        'site-packages', 'lib2to3', '__phello__'}


def tag(module):
    return 'ix_' + module.replace('.', '_')


def iter_modules():
    for root, dirs, files in os.walk(stdlib):
        dirs[:] = sorted(d for d in dirs
                         if d not in SKIP and not d.startswith('config-'))
        rel_dir = os.path.relpath(root, stdlib)

        if rel_dir != '.' and not os.path.isfile(os.path.join(root, '__init__.py')):
            # not a package: nothing under it can be imported by name
            dirs[:] = []
            continue

        for name in sorted(files):
            if not name.endswith('.py'):
                continue

            stem = name[:-3]

            # a dot in the filename is not a package boundary; CPython
            # ships __phello__.foo.py as a frozen-module source
            if '.' in stem:
                continue

            rel = name if rel_dir == '.' else os.path.join(rel_dir, name)
            parts = rel[:-3].split(os.sep)

            if parts[-1] == '__init__':
                parts.pop()

                if not parts:
                    # lib/python3.14/__init__.py, which the ix recipe for
                    # the library drops in to make py_exports walk the tree
                    continue

            module = '.'.join(parts)

            # Leave alone what CPython already freezes into the archive.
            # Those are correct as they are, and one of them must not be
            # compiled: _collections_abc takes type() of an async
            # generator to name the type, and Cython's async functions
            # are its own _cython_3_3_0.async_generator, not CPython's.
            # The interpreter also warns on every startup about the
            # coroutine the module drops.
            if _imp.is_frozen(module):
                continue

            yield module, rel


PACKAGE_PREAMBLE = '''
# ix: this package is compiled into the interpreter rather than read
# from disk, and has to be made to look like a package again.
#
# __path__ gets the import of a submodule as far as the meta path,
# where BuiltinImporter answers for it. The other two are what make a
# relative import inside the package work: the import machinery built
# the spec before any of this ran, saw no submodule_search_locations,
# and so set both spec.parent and __package__ to the empty string --
# and _calc___package__ reads __package__ first.
__path__ = []
__package__ = __name__
try:
    __spec__.submodule_search_locations = __path__
except (AttributeError, NameError):
    pass
'''


def make_package(path):
    """Put the preamble in, after the docstring and any __future__.

    It has to come before the package's own code: encodings does
    "from . import aliases" a few lines in, while the interpreter is
    still starting up.
    """
    with open(path) as f:
        source = f.read()

    after = 0

    for node in ast.parse(source).body:
        if isinstance(node, ast.Expr) and isinstance(node.value, ast.Constant) \
                and isinstance(node.value.value, str):
            after = node.end_lineno
        elif isinstance(node, ast.ImportFrom) and node.module == '__future__':
            after = node.end_lineno
        else:
            break

    lines = source.splitlines(keepends=True)

    with open(path, 'w') as f:
        f.writelines(lines[:after])
        f.write(PACKAGE_PREAMBLE)
        f.writelines(lines[after:])


modules = list(iter_modules())

for module, rel in modules:
    if os.path.basename(rel) == '__init__.py':
        make_package(os.path.join(stdlib, rel))

with open(os.path.join(outdir, 'ixmain.c'), 'w') as f:
    f.write('#include <Python.h>\n\n')

    for module, _ in modules:
        f.write('extern PyObject *PyInit_%s(void);\n' % (tag(module),))

    f.write('\nstatic struct _inittab ix_stdlib[] = {\n')

    for module, _ in modules:
        f.write('    {"%s", PyInit_%s},\n' % (module, tag(module)))

    f.write('    {NULL, NULL},\n};\n\n')
    f.write('int main(int argc, char **argv)\n{\n')
    f.write('    if (PyImport_ExtendInittab(ix_stdlib) < 0) {\n')
    f.write('        fprintf(stderr, "cannot register the compiled stdlib\\n");\n')
    f.write('        return 1;\n    }\n\n')
    f.write('    return Py_BytesMain(argc, argv);\n}\n')

with open(os.path.join(outdir, 'Makefile'), 'w') as f:
    objects = ' '.join(tag(m) + '.o' for m, _ in modules)
    f.write('all: ixmain.o %s\n\n' % (objects,))
    f.write('ixmain.o: ixmain.c\n\t$(CC) $(IX_CFLAGS) -c -o $@ $<\n\n')

    for module, rel in modules:
        t = tag(module)
        last = module.rsplit('.', 1)[-1]
        f.write('%s.c:\n\tPYTHONPATH=$(IX_CYTHON_PATH) ix_cythonize %s %s/%s $@\n\n'
                % (t, module, stdlib, rel))
        f.write('%s.o: %s.c\n\t$(CC) $(IX_CFLAGS) -DPyInit_%s=PyInit_%s -c -o $@ $<\n\n'
                % (t, t, last, t))

print('%d modules' % (len(modules),))
