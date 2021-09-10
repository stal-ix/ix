# dep boot/stage/2/make boot/stage/2/coreutils boot/stage/1/env
{% include '//tool/text/gnu/grep/version.sh' %}

build() {
    $untar $src/grep-* && cd grep-*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
