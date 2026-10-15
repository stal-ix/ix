{# PyPy translated by RPython into one static executable.

   Two things make this build static rather than the upstream default.
   targetpypystandalone suggests translation.shared, which would emit
   libpypy3.12-c.so plus a launcher that dlopens it, so --no-shared is
   not optional here. And the stdlib has to land in share/: die/std's
   postinstall wipes ${out}/lib for a bin package, so --platlibdir=share
   moves the tree find_stdlib() walks up to, exactly as lib/python/3
   does for CPython.

   The cffi part of the stdlib (_ssl, sqlite3, lzma, curses, ...) is a
   separate problem: upstream builds those as .so files after
   translation. They are not built here. #}

{% extends '//die/c/ix.sh' %}

{% include 'ver.sh' %}

{% block pkg_name %}
pypy
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{# rpython puts -Wl,--export-dynamic on every link it makes, probes and
   pypy-c alike (posix.py _exportsymbols_link_flags). For a static
   binary the flag means nothing, and the registering variant of the
   plugin would walk every object of the translated interpreter and
   emit a dl entry per symbol -- hundreds of thousands of them. Nothing
   here dlsym()s the executable: extension modules resolve their
   references at link time, so drop the flag instead. #}
wrap_rdynamic_fake
{% endblock %}

{# ix hands build steps to assemble through sudo, which on stal/ix is
   ssh into a local sud_server, and that session is dropped after 60
   seconds with no traffic on it. Every other package prints compiler
   output the whole way through; RPython's annotation phase says
   nothing for many minutes and the build dies mid-translation. Keep a
   trickle going for as long as the script runs. (The cleaner fix is
   -I 0 on the sud_server command line in bin/sud.) #}
{% block script_prologue %}
{{super()}}
(
    while true; do
        sleep 30
        echo "[ix] still building {{name}}"
    done
) &
ix_keepalive=$!
trap 'kill ${ix_keepalive} 2>/dev/null || true' EXIT
{% endblock %}

{% block bld_tool %}
bld/pypy/py2
bld/pypy/pycparser
bld/make
bld/pkg/config
{% endblock %}

{% block pypy_cffi_libs %}
{% endblock %}

{% block bld_libs %}
{{self.pypy_cffi_libs()}}
lib/c
lib/ffi
lib/z
lib/bzip/2
lib/kernel
lib/ncurses
lib/dlfcn
lib/c/dl
{% endblock %}

{% block patch %}
{# vmprof's libbacktrace wants dl_iterate_phdr and a live dynamic section #}
sed -e 's|IS_SUPPORTED = (|IS_SUPPORTED = False and (|' \
    -i rpython/rlib/rvmprof/cintf.py

{# pyexpat asserts at translation time that expat is not the UTF-16
   build, by actually calling XML_ExpatVersion(). The interpreter is not
   translated yet, so the call goes through ll2ctypes, which compiles
   the vendored expat into a temporary .so and dlopens it -- the one
   thing a static host python cannot do. The check is build-time only;
   the translated binary calls into its own linked-in expat. #}
sed -e 's|^\( *\)ver = space.unwrap(interp_pyexpat.get_expat_version(space))|\1ver = "0.0.0"|' \
    -i pypy/module/pyexpat/moduledef.py
grep -n 'ver = ' pypy/module/pyexpat/moduledef.py

{# The two-way string search helpers get annotated from whichever
   caller the annotator reaches first -- rstr's ll_search passes a
   needle that cannot be None -- and a later caller then arrives with
   can_be_None=True, which RPython refuses to widen an existing
   annotation into. _search_normal already asserts its haystack is not
   None; the needle never is either, on any path that reaches these
   helpers, so assert that too and every caller agrees. #}
sed -e 's|^\( *\)assert value is not None$|\1assert value is not None\n\1assert other is not None|' \
    -e 's|^\( *\)cut1, period1 = _lex_search(needle, len_needle, False)|\1assert needle is not None\n\1cut1, period1 = _lex_search(needle, len_needle, False)|' \
    -e 's|^\( *\)cut, period = _factorize(needle, len_needle)|\1assert needle is not None\n\1cut, period = _factorize(needle, len_needle)|' \
    -i rpython/rlib/rstring.py
grep -c 'is not None' rpython/rlib/rstring.py

{# A cffi module compiled into the interpreter has no file next to it,
   and the path-based finder only ever offers what it can see in a
   directory -- so the import fails before the loader is ever asked.
   The loader itself needs no file: dlopen here resolves a name
   against the table the linked-in code registered, and an origin of
   just the module name reaches it.

   importlib's two bootstrap modules are compiled into the binary at
   translation time (pypy/module/_frozen_importlib/moduledef.py reads
   them straight out of lib-python), so teaching this one is a change
   to the interpreter and not to anything on disk. #}
cat >> lib-python/3/importlib/_bootstrap_external.py << 'IX_STATIC_EXT'


class _IXStaticExtensionFinder:

    """Finds extension modules linked into the interpreter itself.

    ix builds this pypy as one static executable, so the cffi modules
    of the stdlib are compiled in rather than shipped as shared
    objects beside it. There is nothing for PathFinder to see, but
    dlopen still answers for them, keyed by module name.
    """

    _names = frozenset([{% for x in self.pypy_cffi_modules() | parse_list %}'{{x}}', {% endfor %}])

    @classmethod
    def find_spec(cls, fullname, path=None, target=None):
        if fullname not in cls._names:
            return None
        # dlopen reduces the origin to its basename and cuts it at the
        # first dot, so a module inside a package -- _sha3._sha3_cffi --
        # has to be handed the last component alone
        origin = fullname.rpartition('.')[2]
        return spec_from_file_location(
            fullname, origin,
            loader=ExtensionFileLoader(fullname, origin))
IX_STATIC_EXT

sed -e 's|^\( *\)sys.meta_path.append(PathFinder)|\1sys.meta_path.append(_IXStaticExtensionFinder)\n&|' \
    -i lib-python/3/importlib/_bootstrap_external.py
grep -n 'meta_path.append' lib-python/3/importlib/_bootstrap_external.py

{# ll2ctypes builds the function's eci into a .so and dlopens it, which
   a static host python cannot do. Everything it needs is already in
   the translating process -- libc and the RPython runtime arrive
   through lib/c/dl and lib/pypy/syms/dl on bld/pypy/py2, and the
   binary's own symbols through wrap_rdynamic there. So when the
   process-wide dl table already answers, skip the shared library
   entirely and let the existing standard_c_lib fallback take it. #}
sed -e 's|^\( *\)libraries = eci.testonly_libraries + eci.libraries + eci.frameworks|&\n\1if get_on_lib(standard_c_lib, funcname) is not None:\n\1    libraries = []|' \
    -i rpython/rtyper/lltypesystem/ll2ctypes.py
grep -n -A2 'libraries = eci.testonly_libraries' rpython/rtyper/lltypesystem/ll2ctypes.py
{% endblock %}

{# the JIT is the whole point of PyPy; without it the interpreter is
   slower than CPython. Override to 2 for a quicker, plainer build. #}
{% block pypy_opt %}
jit
{% endblock %}

{% block build %}
cd pypy/goal
python2 ../../rpython/bin/rpython \
    --opt={{self.pypy_opt().strip()}} \
    --no-shared \
    --cc=cc \
    --make-jobs=${make_thrs} \
    targetpypystandalone \
    --platlibdir=share
{% endblock %}

{% block install %}
STDLIB=${out}/share/pypy{{self.py_ver().strip()}}

mkdir -p ${out}/bin ${STDLIB}

{# driver.exe_name is 'pypy<major>.<minor>-c'; upstream's Makefile
   still says pypy3-c, so take whichever the translation produced #}
cp pypy/goal/pypy3*-c ${out}/bin/pypy{{self.py_ver().strip()}}
ln -s pypy{{self.py_ver().strip()}} ${out}/bin/pypy3
ln -s pypy{{self.py_ver().strip()}} ${out}/bin/pypy

{# the release layout merges both trees into one directory, and drops
   the __init__.py lib_pypy carries for its own sake #}
cp -R lib-python/3/. ${STDLIB}/
cp -R lib_pypy/. ${STDLIB}/
rm -f ${STDLIB}/__init__.py
mkdir -p ${STDLIB}/site-packages

find ${STDLIB} -name '__pycache__' -type d | while read l; do
    rm -rf "${l}"
done
find ${STDLIB} -name '*.pyc' -delete
rm -rf ${STDLIB}/test ${STDLIB}/idlelib ${STDLIB}/tkinter

{# cpyext writes its headers, generated ones included, next to the
   source tree while translating. lib/pypy/cffi compiles against them.
   They cannot live in ${out}/include: postinstall clears that for a
   bin package. #}
mkdir -p ${out}/share/pypy-include
cp -R include/pypy{{self.py_ver().strip()}}/. ${out}/share/pypy-include/

{% endblock %}

{# the cffi modules linked into this interpreter; the frozen importlib
   is taught to find them without a file on disk #}
{% block pypy_cffi_modules %}
{% endblock %}

{% block env %}
export PYPY_INCLUDE="${out}/share/pypy-include"
export PYPY_STDLIB="${out}/share/pypy{{self.py_ver().strip()}}"
{% endblock %}
