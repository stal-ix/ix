$untar ${src}/Python* && cd Python*

base64 -d << EOF > fix.py
{% include 'fix.py/base64' %}
EOF

setup_compiler

export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v 'with-system-ffi' | tr '\n' ' ')

sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' -i ./configure
sed -e 's/ffi_type ffi_type.*//' -e 's/FFI_TYPE_LONGDOUBLE }.*//' -i Modules/_ctypes/cfield.c

dash ./configure ${COFLAGS} \
     --prefix=${out} \
     --with-ensurepip=no \
     --with-system-libmpdec \
     --with-system-expat \
     --with-system-ffi

make -j ${make_thrs}

if test -f python; then
    ln -s python python.exe
fi

./python.exe ./fix.py patch ./setup.py
DUMP=1 ./python.exe ./setup.py build > data.json
./python.exe ./fix.py ./data.json | grep -v 'nis' > Modules/Setup.local

rm ./python.exe*

make -j ${make_thrs}
make install
