# dep boot/stage/1/env
{% include '//dev/build/make/version.sh' %}

build() {
    $untar $src/make-* && cd make-*

    export CPPFLAGS="-I./glob -Dglob=make_glob -Dglobfree=make_globfree -Dfnmatch=make_fnmatch $CPPFLAGS"

    dash ./configure $COFLAGS \
        --prefix=$out \
        --disable-load

    bmake -j $make_thrs
    bmake install
}
