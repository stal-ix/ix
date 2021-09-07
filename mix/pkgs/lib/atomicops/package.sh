# url https://github.com/ivmai/libatomic_ops/releases/download/v7.6.10/libatomic_ops-7.6.10.tar.gz
# md5 90a78a84d9c28ce11f331c25289bfbd0
# dep dev/build/make env/std

build() {
    $untar $src/lib* && cd lib*

    dash ./configure $COFLAGS --prefix="$out"
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -latomic_ops \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
