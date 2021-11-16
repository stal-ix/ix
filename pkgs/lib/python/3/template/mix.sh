{% extends '//mix/template/autohell.sh' %}

{% block lib_deps %}
lib/python/libs/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2.69/mix.sh
dev/build/automake/1.16.3/mix.sh
dev/build/autoconf/archive/mix.sh
{% endblock %}

{% block bld_libs %}
{{'lib/linux/mix.sh' | linux}}
{% endblock %}

{% block autoreconf %}
libtoolize -c
autoreconf -i
sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' -i ./configure
{% endblock %}

{% block toolconf %}
cat << EOF > which
#!$(command -v dash)
command -v \$@
EOF

chmod +x which

{% if mix.platform.target.os == 'darwin' %}
cat << EOF > sw_vers
#!$(command -v dash)
echo ${MACOSX_DEPLOYMENT_TARGET}
EOF

chmod +x sw_vers
{% endif %}
{% endblock %}

{% block patch %}
sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' -i ./configure
sed -e 's|spec is None|spec is None or spec.loader is None|' -i Lib/modulefinder.py
sed -e 's|/usr|/eat/shit|' -i ./setup.py
sed -e 's|/usr|/eat/shit|' -i ./Makefile.pre.in

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
{{'_scproxy _scproxy.c' | darwin}}

{% block extra_modules %}
readline readline.c
_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c _ctypes/malloc_closure.c -DPy_BUILD_CORE_MODULE
_hashlib _hashopenssl.c
_ssl _ssl.c -DUSE_SLL
_lzma _lzmamodule.c
_bz2 _bz2module.c
_sqlite3 _sqlite/cache.c _sqlite/connection.c _sqlite/cursor.c _sqlite/microprotocols.c _sqlite/module.c _sqlite/prepare_protocol.c _sqlite/row.c _sqlite/statement.c _sqlite/util.c -DSQLITE_OMIT_LOAD_EXTENSION
{% endblock %}
EOF
{% endblock %}
{% endblock %}

{% block coflags %}
--with-ensurepip=no
{% endblock %}

{% block test %}
${out}/bin/python3 -c 'import zlib; import multiprocessing; import cProfile;'
{% block extra_tests %}
${out}/bin/python3 -c 'import hashlib; import ssl; import lzma; import bz2; import sqlite3; import decimal; import ctypes;'
{% endblock %}
{% endblock %}

{% block install %}
{{super()}}

cp -R Tools/freeze ${out}/bin/
rm -rf ${out}/lib/python*/test
${out}/bin/python3 -c 'import configparser;'
find ${out} | grep __pycache__ | xargs rm -rf
{% endblock %}
