# dep boot/lib/compiler_rt
# dep boot/stage/3/env
{% include '//dev/lang/python3/version.sh' %}

build() {
    $untar $src/Python* && cd Python*

    setup_compiler

    sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' -i ./configure

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-ensurepip=no

    make -j $make_thrs
    make install
}
