# dep boot/stage/4/coreutils boot/stage/3/env
{% include '//tool/text/gnu/gawk/version.sh' %}

build() {
    $untar $src/gawk-* && cd gawk-*

    export CPPFLAGS="-Derr=gawk_err -Dxmalloc=gawk_xmalloc -Dxrealloc=Dgawk_xrealloc -Dregcomp=gawk_regcomp -Dregfree=gawk_regfree $CPPFLAGS"

    dash ./configure $COFLAGS \
        --prefix=$out \
        --libexecdir=$out/bin/awk_exec \
        --disable-extensions

    make -j $make_thrs
    make install
}
