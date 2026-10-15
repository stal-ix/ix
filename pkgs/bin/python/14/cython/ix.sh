{# CPython 3.14 whose standard library is native code.

   Nothing here is fetched. lib/python/3/14 already builds CPython as a
   library -- libpython3.14.a, the headers, and the stdlib as .py -- so
   this takes the .py, runs Cython over every module, compiles the
   result, and links it all against that archive. The binary carries no
   stdlib on disk.

   Each module goes into the inittab under its full dotted name, which
   works because 3.14's BuiltinImporter.find_spec no longer refuses a
   name that arrived with a parent path, and is_builtin compares the
   whole string (Python/import.c). A compiled package needs a __path__
   of its own for its submodules to be reachable, and an empty one is
   enough: the import of a submodule then reaches the meta path, where
   BuiltinImporter answers. #}

{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
python-cython
{% endblock %}

{% block py_ver %}
3.14
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/cython
bld/python
bld/python/14
bld/make
{% endblock %}

{% block bld_libs %}
lib/c
lib/python/3/14
{% endblock %}

{% block step_unpack %}
: the stdlib is copied in the patch step, when the library env is up
{% endblock %}

{% block patch %}
{# TARGET_PYTHONHOME arrives with the target library environment, which
   is sourced in the setup step -- after unpack, before this #}
mkdir ${tmp}/stdlib
cp -R ${TARGET_PYTHONHOME}/lib/python{{self.py_ver().strip()}}/. ${tmp}/stdlib/
chmod -R u+w ${tmp}/stdlib
cd ${tmp}/stdlib

{# the library recipe drops these in for py_exports to walk the tree #}
rm -f __init__.py exports

{# --- PEP 695, which Cython does not parse. All of six places in the
       3.14 stdlib, so they are rewritten rather than taught. --- #}

{# typing has TypeVar T by line 2734, before either use #}
sed -e 's|^class SupportsAbs\[T\](Protocol):|class SupportsAbs(Protocol[T]):|' \
    -e 's|^class SupportsRound\[T\](Protocol):|class SupportsRound(Protocol[T]):|' \
    -e 's|^def reveal_type\[T\](obj: T, /) -> T:|def reveal_type(obj, /):|' \
    -e 's|^\( *\)def __call__\[T\](self, arg: T, /) -> T:|\1def __call__(self, arg, /):|' \
    -e 's|^def override\[F: _Func\](method: F, /) -> F:|def override(method, /):|' \
    -e 's|^type _Func = |_Func = |' \
    -i typing.py

{# _pyrepl has 'from __future__ import annotations', so the annotations
   left behind are strings and never evaluated #}
sed -e 's|^def prev_next_window\[T\](|def prev_next_window(|' \
    -i _pyrepl/utils.py
sed -e 's|^type \([A-Za-z_][A-Za-z_0-9]*\) = |\1 = |' \
    -i _pyrepl/types.py

{# --- three one-off limitations --- #}

{# Cython will not delete a name a nested scope closed over; rebinding
   drops the reference just as well #}
sed -e 's|^\( *\)del exceptions, propagate_cancellation_error, unhandled_exceptions, parent_task$|\1exceptions = propagate_cancellation_error = unhandled_exceptions = parent_task = None|' \
    -i asyncio/staggered.py

{# Cython knows exec as a three-argument builtin and 3.11 gave it a
   closure keyword; go through the module instead #}
sed -e 's|^\( *\)exec(code, globals, locals_copy, closure=cells)|\1builtins.exec(code, globals, locals_copy, closure=cells)|' \
    -e 's|^import sys$|import sys\nimport builtins|' \
    -i pdb.py

{# the parameter only exists to make the module-level sentinel a local;
   Cython trips over a parameter shadowing the name of its own default #}
sed -e 's|^\( *\)deep=True, _KEEP=_KEEP):|\1deep=True):|' \
    -i tarfile.py

{% endblock %}

{% block build %}
base64 -d << IX_PLAN > ${tmp}/ix_plan.py
{% include 'plan.py/base64' %}
IX_PLAN

cd ${tmp}

{# The library puts its stdlib on PYTHONPATH, and every python that
   runs during this build -- the planner, and the link helpers inside
   the cc wrapper -- already has one of its own. A 3.14 stdlib read by
   an older interpreter does not even parse: site.py uses the
   unparenthesised except of PEP 758, which is 3.14 syntax.

   Nothing here needs that stdlib importable; ix_cythonize reads the
   sources by path, and the Makefile hands it Cython's own directory. #}
export PYTHONPATH=

{# the planner reads the 3.14 stdlib with ast, so it needs a 3.14 to
   read it with: PEP 758's unparenthesised except and PEP 695 both
   parse nowhere else #}
${NATIVE_PYTHON} ix_plan.py ${tmp}/stdlib ${tmp}

make -j ${make_thrs} \
    CC="$(command -v cc)" \
    IX_CYTHON_PATH="${IX_CYTHON_PATH}" \
    IX_CFLAGS="${CPPFLAGS} ${CFLAGS}"

cc -o python{{self.py_ver().strip()}} ixmain.o ix_*.o ${LDFLAGS}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp ${tmp}/python{{self.py_ver().strip()}} ${out}/bin/
cd ${out}/bin
ln -s python{{self.py_ver().strip()}} python3
ln -s python{{self.py_ver().strip()}} python
{% endblock %}
