{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tar.xz
# md5 71f7ada6bec9cdbf4538adc326120cfd
{% endblock %}

{% block deps %}
# bld lib/z lib/xz lib/ffi lib/intl lib/gdbm lib/bzip2 lib/iconv
# bld lib/expat lib/sqlite3 lib/ncurses lib/openssl lib/readline
# bld lib/mpdecimal {{mix.if_linux('lib/linux')}}
# bld env/std boot/final/env/tools
{% endblock %}

{% block patch %}
base64 -d << EOF > fix.py
{% include 'fix.py/base64' %}
EOF

sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' \
    -i ./configure

sed -e 's/ffi_type ffi_type.*//'      \
    -e 's/FFI_TYPE_LONGDOUBLE }.*//'  \
    -i Modules/_ctypes/cfield.c
{% endblock %}

{% block cflags %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v 'with-system-ffi' | tr '\n' ' ')
{% endblock %}

{% block coflags %}
--with-ensurepip=no
--with-system-libmpdec
--with-system-expat
--with-system-ffi
{% endblock %}

{% block build %}
make -j ${make_thrs}

if test -f python; then
    ln -s python python.exe
fi

./python.exe ./fix.py patch ./setup.py
DUMP=1 ./python.exe ./setup.py build > data.json
./python.exe ./fix.py ./data.json | grep -v 'nis' > Modules/Setup.local

rm ./python.exe*
make -j ${make_thrs}
{% endblock %}
