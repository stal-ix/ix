# url https://github.com/ivmai/bdwgc/releases/download/v8.0.4/gc-8.0.4.tar.gz
# md5 67a5093e2f9f381bd550aa891d00b54b
# url https://github.com/ivmai/bdwgc/commit/5668de71107022a316ee967162bc16c10754b9ce.patch?full_index=1
# md5 10435b33b8cf10ff0afa043f04ccc324
# lib lib/cxx lib/atomicops
# bld dev/build/make dev/build/pkg-config env/std

build() {
    $untar $src/gc* && cd gc*

    cat $src/*.patch* | patch -p1

    dash ./configure $COFLAGS \
        --disable-debug \
        --disable-dependency-tracking \
        --prefix=$out \
        --enable-cplusplus \
        --enable-large-config

    make -j $make_thrs
    make tests
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lgc \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
