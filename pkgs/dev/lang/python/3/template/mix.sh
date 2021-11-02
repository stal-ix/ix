{% extends '//mix/template/autohell.sh' %}

{% block bld_deps %}
dev/lang/python/libs/mix.sh
{{'lib/linux/mix.sh' | linux}}
env/autohell/mix.sh
{% endblock %}

{% block patch %}
sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' \
    -i ./configure

{% block patch_ffi %}
sed -e 's/ffi_type ffi_type.*//'      \
    -e 's/FFI_TYPE_LONGDOUBLE }.*//'  \
    -i Modules/_ctypes/cfield.c

>Modules/_ctypes/malloc_closure.c
{% endblock %}

sed -e 's|/usr|/eat/shit|' -i ./setup.py
sed -e 's|/usr|/eat/shit|' -i ./Makefile.pre.in

base64 -d << EOF > fix.awk
{% include 'fix.awk/base64' %}
EOF

cat Modules/Setup | awk -f fix.awk | sed -e 's|-l.*||' | grep -v capi | grep -v nis | grep -v readline | grep -v spwd > Modules/Setup.local

# some hand job
cat << EOF >> Modules/Setup.local
_lsprof _lsprof.c rotatingtree.c
_opcode _opcode.c
_posixshmem _multiprocessing/posixshmem.c -I$(srcdir)/Modules/_multiprocessing
_multiprocessing _multiprocessing/multiprocessing.c _multiprocessing/semaphore.c -I$(srcdir)/Modules/_multiprocessing
_queue _queuemodule.c
EOF

# extra hand job
{% block extra_modules %}
cat << EOF >> Modules/Setup.local
readline readline.c
_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c _ctypes/malloc_closure.c -DPy_BUILD_CORE_MODULE
_hashlib _hashopenssl.c
_ssl _ssl.c -DUSE_SLL
_lzma _lzmamodule.c
_bz2 _bz2module.c
_sqlite3 _sqlite/cache.c _sqlite/connection.c _sqlite/cursor.c _sqlite/microprotocols.c _sqlite/module.c _sqlite/prepare_protocol.c _sqlite/row.c _sqlite/statement.c _sqlite/util.c -DSQLITE_OMIT_LOAD_EXTENSION
EOF

{% block patch_sqlite_defines %}
{% endblock %}
{% endblock %}

>setup.py

sed -e 's|spec is None|spec is None or spec.loader is None|' -i Lib/modulefinder.py
{% endblock %}

{% block coflags %}
--with-ensurepip=no
--with-system-libmpdec
--with-system-expat
--with-system-ffi
{% endblock %}

{% block test %}
${out}/bin/python3 -c 'import zlib; import multiprocessing; import cProfile;'
{% block extra_tests %}
${out}/bin/python3 -c 'import hashlib; import ssl; import lzma; import bz2; import sqlite3;'
{% endblock %}
{% endblock %}

{% block postinstall %}
cp -R Tools/freeze ${out}/bin/
rm -rf ${out}/lib/python*/test
${out}/bin/python3 -c 'import configparser;'
find ${out} | grep __pycache__ | xargs rm -rf
{% block extra_postinstall %}
{% endblock %}
{% endblock %}
