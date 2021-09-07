# dep lib/intl lib/iconv lib/sigsegv dev/build/make env/c boot/final/env
{% include 'version.sh' %}

build() {
    $untar $src/gawk-* && cd gawk-*

    export CPPFLAGS="-Derr=gawk_err -Dxmalloc=gawk_xmalloc -Dxrealloc=Dgawk_xrealloc -Dregcomp=gawk_regcomp -Dregfree=gawk_regfree $CPPFLAGS"

    dash ./configure $COFLAGS \
        --prefix=$out \
        --libexecdir=$out/bin/awk_exec \
        --disable-shared \
        --enable-static \
        --disable-extensions

    make
    make install
}
