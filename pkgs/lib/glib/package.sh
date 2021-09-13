# url https://download-fallback.gnome.org/sources/glib/2.68/glib-2.68.4.tar.xz
# md5 07ba0e946bf6dcad36388675d2f2876f
# lib lib/z lib/pcre lib/iconv lib/ffi lib/intl
# lib {{'sys/framework/CoreServices sys/framework/Foundation' | darwin}}
# bld dev/build/meson env/std boot/final/env

build() {
    $untar ${src}/glib* && cd glib*

    ln -s $(which dash) sh
    export CPPFLAGS="-w -D_GNU_SOURCE=1 -I$(pwd)/inc $CPPFLAGS"

    setup_compiler

    echo 'int main() {}' > glib/tests/cxx.cpp
    echo 'int main() {}' > tests/cxx-test.cpp

    gcc -c -o main.o -x c - << EOF
int main() {}
EOF

    ar q libmain.a main.o

    export LDFLAGS="-L$(pwd) -lmain $LDFLAGS"

    meson \
        --libdir "${out}/lib" \
        -Ddefault_library=static \
        -Dprefix=${out} \
        -Diconv=external \
        _build {{mix.if_darwin('-Db_asneeded=false -Db_lundef=false')}}

    (
        cd _build

        ninja -j ${make_thrs}
        ninja install
    )

    cat << EOF > ${out}/env
export CPPFLAGS="-I${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -lglib-2.0 -lgobject-2.0 -lgio-2.0 -lgmodule-2.0 -lgthread-2.0 \$LDFLAGS"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
