# dep boot/stage/4/coreutils boot/stage/3/env
{% include '//tool/text/gnu/grep/version.sh' %}

build() {
    $untar $src/grep-* && cd grep-*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
