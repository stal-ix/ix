# bld boot/lib/iconv
# bld boot/stage/5/env
{% include '//dev/build/pkg-config/version.sh' %}

build() {
    $untar $src/pkg* && cd pkg*

    ln -s $(which dash) sh
    setup_compiler

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-internal-glib \
        --disable-host-tool

    (
        cd glib

        dash ./configure $COFLAGS \
            --prefix=$out \
            --with-libiconv=gnu \
            --srcdir=.

        make -j $make_thrs
    )

    make -j $make_thrs
    make install
}
