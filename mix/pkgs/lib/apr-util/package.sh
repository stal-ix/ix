# url https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.bz2
# md5 8ff5dc36fa39a2a3db1df196d3ed6086
# lib lib/apr lib/gdbm lib/iconv lib/expat lib/sqlite3 lib/openssl
# dep dev/build/make dev/build/pkg-config env/std

build() {
    $untar $src/apr* && cd apr*

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-dbm=gdbm \
        --disable-util-dso

    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -laprutil-1 \$LDFLAGS"
export COFLAGS="--with-apr-util=$out --with-libapr-util=$out \$COFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
