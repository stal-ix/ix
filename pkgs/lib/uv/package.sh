# url https://dist.libuv.org/dist/v1.41.0/libuv-v1.41.0.tar.gz
# md5 d990b0770dd2b15f7a8399580d55d32c
# bld dev/build/autoconf dev/build/automake dev/build/libtool dev/build/make env/std

build() {
    $untar $src/libuv* && cd libuv*

    export LIBTOOLIZE=libtoolize

    dash ./autogen.sh
    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -luv \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DCMAKE_USE_SYSTEM_LIBUV=ON -DLibUV_LIBRARY=$out/lib/libuv.a -DLibUV_INCLUDE_DIR=$out/include \$CMFLAGS"
EOF
}
