# url https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
# md5 294b921e6cf9ab0fbaea4b639f8fdbe8
# dep {{mix.if_linux('lib/linux')}}
# dep dev/build/make tool/text/gnu/sed env/tools env/c env/bootstrap

build() {
    $untar $src/lib* && cd lib*

    ln -s $(which dash) sh

    setup_compiler

    sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
        -i include/Makefile.in

    sed -e '/^includedir/ s/=.*$/=@includedir@/' \
        -e 's/^Cflags: -I${includedir}/Cflags:/' \
        -i libffi.pc.in

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export LIBFFI_CFLAGS="-I$out/include"
export LIBFFI_LIBS="-L$out/lib -lffi"
export CPPFLAGS="\$LIBFFI_CFLAGS \$CPPFLAGS"
export LDFLAGS="\$LIBFFI_LIBS \$LDFLAGS"
export COFLAGS="--with-system-ffi=$out \$COFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
