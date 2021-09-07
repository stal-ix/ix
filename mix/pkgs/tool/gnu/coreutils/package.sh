# dep lib/intl lib/iconv lib/sigsegv
# dep env/c dev/build/make tool/text/gnu/patch boot/final/env
{% include 'version.sh' %}

build() {
    $untar $src/coreutils-* && cd coreutils-*

    export FORCE_UNSAFE_CONFIGURE=1

    (base64 -d | patch -p1) << EOF
{% include  '//boot/stage/2/coreutils/uname.patch/base64' %}
EOF

    setup_compiler

    dash ./configure $COFLAGS \
        --prefix=$out \
        --libexecdir=$out/bin \
        --without-gmp \
        --enable-no-install-program=stdbuf \
        --enable-single-binary=symlinks

    cat Makefile | grep -v 'LIBINTL = ' > tmp && mv tmp Makefile

    make -j $make_thrs
    make install
}
