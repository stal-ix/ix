{% extends '//die/c/autorehell.sh' %}

{% block lib_deps %}
lib/python/libs
{% endblock %}

{% block bld_tool %}
bld/auto/archive
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block patch_configure %}
{{super()}}
sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' -i configure
{% endblock %}

{% block patch %}
sed -e 's|spec is None|spec is None or spec.loader is None|' -i Lib/modulefinder.py
sed -e 's|/usr|/eat/shit|' -i setup.py
sed -e 's|/usr|/eat/shit|' -i Makefile.pre.in

>setup.py

{% block ensure_static_build %}
{% block patch_ffi %}
sed -e 's/ffi_type ffi_type.*//'      \
    -e 's/FFI_TYPE_LONGDOUBLE }.*//'  \
    -i Modules/_ctypes/cfield.c

>Modules/_ctypes/malloc_closure.c
{% endblock %}

base64 -d << EOF > fix.awk
{% include 'fix.awk/base64' %}
EOF

cat Modules/Setup \
    | awk -f fix.awk    \
    | sed -e 's|-l.*||' \
    | grep -v capi      \
    | grep -v nis       \
    | grep -v readline  \
    | grep -v spwd      \
    > Modules/Setup.local

# some hand job
cat << EOF >> Modules/Setup.local
_lsprof _lsprof.c rotatingtree.c
_opcode _opcode.c
_posixshmem _multiprocessing/posixshmem.c -I\$(srcdir)/Modules/_multiprocessing
_multiprocessing _multiprocessing/multiprocessing.c _multiprocessing/semaphore.c -I\$(srcdir)/Modules/_multiprocessing
_queue _queuemodule.c

{% if darwin %}
_scproxy _scproxy.c
{% endif %}

{% block extra_modules %}
readline readline.c
_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c _ctypes/malloc_closure.c
_hashlib _hashopenssl.c
_ssl _ssl.c
_lzma _lzmamodule.c
_bz2 _bz2module.c
_sqlite3 _sqlite/cache.c _sqlite/connection.c _sqlite/cursor.c _sqlite/microprotocols.c _sqlite/module.c _sqlite/prepare_protocol.c _sqlite/row.c _sqlite/statement.c _sqlite/util.c
{% endblock %}
EOF
{% endblock %}
{% endblock %}

{% block cpp_defines %}
USE_SSL=1
Py_BUILD_CORE_MODULE=1
SQLITE_OMIT_LOAD_EXTENSION=1
{% endblock %}

{% if lib %}
{% set platlibdir %}lib{% endset %}
{% else %}
{% set platlibdir %}share{% endset %}
{% endif %}

{% block configure_flags %}
--with-platlibdir={{platlibdir}}
--with-ensurepip=no
{% endblock %}

{% block test_bin %}
${out}/bin/python3 -c 'import zlib; import multiprocessing; import cProfile;'
{% block extra_tests %}
${out}/bin/python3 -c 'import hashlib; import ssl; import lzma; import bz2; import sqlite3; import decimal; import ctypes;'
{% endblock %}
{% endblock %}

{% block install %}
{{super()}}
cp -R Tools/freeze ${out}/share/
rm -rf ${out}/{{platlibdir}}/python*/test
find ${out}/ | grep __pycache__ | xargs rm -rf
find ${out}/bin/ ${out}/share/ | grep '\.[ao]$' | xargs rm{% if lib %} || true{% endif %}
{% endblock %}

{% block env_lib %}
{% if lib %}
export TARGET_PYTHONHOME="${out}"
export CPPFLAGS="-I$(echo ${out}/include/python*) \${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block purge_empty_dirs %}
{% endblock %}
