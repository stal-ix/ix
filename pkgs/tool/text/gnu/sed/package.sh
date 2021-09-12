# bld lib/intl lib/iconv env/c boot/final/env
{% include 'version.sh' %}

build() {
    $untar $src/sed-* && cd sed-*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
