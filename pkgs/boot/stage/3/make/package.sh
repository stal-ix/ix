# dep boot/stage/1/musl boot/stage/2/env
{% include '//dev/build/make/version.sh' %}

build() {
    $untar $src/make-* && cd make-*

    export CPPFLAGS="-I$(pwd)/glob -I$(pwd)/lib $CPPFLAGS"

{% if mix.platform.target.os == 'darwin' %}
    export CPPFLAGS="-Dglob=make_glob -Dglobfree=make_globfree -Dfnmatch=make_fnmatch $CPPFLAGS"
{% endif %}

    dash ./configure $COFLAGS \
        --prefix=$out \
        --disable-load

    >lib/fnmatch.c

    dash ./build.sh

    ./make -j $make_thrs
    ./make install
}
