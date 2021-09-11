# url http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
# md5 f433a39be087a9f0b197eb2307ad9f75
# dep lib/iconv boot/final/env

build() {
    $untar $src/libxml* && cd libxml*

    dash ./configure $COFLAGS \
        --prefix="$out" \
        --with-ftp=off \
        --with-http=off \
        --with-modules=off

    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lxml2 \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export COFLAGS="--with-libxml2-prefix=$out \$COFLAGS"
EOF
}
