# url http://thrysoee.dk/editline/libedit-20210522-3.1.tar.gz
# md5 6ad9e9208daf031adf1ebc64441769e0
# lib lib/ncurses
# bld dev/build/make env/std

build() {
    $untar $src/libedit* && cd libedit*

    ln -s $(which dash) sh

    export PATH="$(pwd):$PATH"
    export CPPFLAGS="-D__STDC_ISO_10646__=1 $CPPFLAGS"

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export COFLAGS="--with-libedit=$out \$COFLAGS"
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -ledit \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
