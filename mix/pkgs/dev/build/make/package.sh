# dep lib/intl lib/iconv boot/final/make env/c boot/final/env
{% include 'version.sh' %}

build() {
    $untar $src/make-* && cd make-*

    export CPPFLAGS="-I./glob -Dglob=make_glob -Dglobfree=make_globfree -Dfnmatch=make_fnmatch $CPPFLAGS"

    dash ./configure $COFLAGS \
        --prefix=$out \
        --disable-load

    make -j $make_thrs
    make install
}
