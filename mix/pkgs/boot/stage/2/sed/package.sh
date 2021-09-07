# dep boot/stage/2/make boot/stage/2/coreutils boot/stage/1/env
{% include '//tool/text/gnu/sed/version.sh' %}

build() {
    $untar $src/sed-* && cd sed-*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
