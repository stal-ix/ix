# url http://zlib.net/zlib-1.2.11.tar.xz
# md5 85adef240c5f370b308da8c938951a68
# dep env/c boot/final/make boot/final/env

build() {
    $untar $src/zlib* && cd zlib*

    setup_compiler

    dash ./configure --static --64 --prefix="$out"
    make -j $make_thrs TEST_LDFLAGS="-L. libz.a"
    make install

    mkdir $out/bin && cp minigzip $out/bin/

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lz \$LDFLAGS"
export COFLAGS="--with-z=$out \$COFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DZLIB_LIBRARY=$out/lib/libz.a -DZLIB_INCLUDE_DIR=$out/include -DCMAKE_USE_SYSTEM_ZLIB=ON \$CMFLAGS"
EOF
}
