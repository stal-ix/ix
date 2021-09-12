# bld boot/stage/4/env
{% include '//tool/gnu/findutils/version.sh' %}

build() {
    $untar $src/find* && cd find*

    (cd gl/lib/malloc && echo '#define __nonnull(x)' > tmp && cat dynarray-skeleton.c >> tmp && mv tmp dynarray-skeleton.c)

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
