# bld boot/stage/4/coreutils boot/stage/3/env
{% include '//tool/text/gnu/sed/version.sh' %}

build() {
    $untar $src/sed-* && cd sed-*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
