# url https://github.com/libexpat/libexpat/releases/download/R_2_4_1/expat-2.4.1.tar.xz
# md5 a4fb91a9441bcaec576d4c4a56fa3aa6
# dep dev/build/make env/tools env/c env/bootstrap

build() {
    $untar $src/expat* && cd expat*

    dash ./configure $COFLAGS \
        --prefix=$out \
        --without-examples

    make -j $make_thrs
    make install

    cat << EOF > $out/env
export COFLAGS="--with-expat=$out \$COFLAGS"
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lexpat \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DCMAKE_USE_SYSTEM_EXPAT=ON -DEXPAT_LIBRARY=$out/lib/libexpat.a -DEXPAT_INCLUDE_DIR=$out/include \$CMFLAGS"
EOF
}
