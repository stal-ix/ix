# dep boot/stage/2/make boot/stage/1/env
{% include '//tool/gnu/coreutils/version.sh' %}

build() {
    $untar $src/coreutils-* && cd coreutils-*

    setup_compiler

    dash ./configure $COFLAGS \
        --prefix="$out" \
        --libexecdir="$out/bin" \
        --without-gmp \
        --enable-no-install-program=stdbuf \
        --enable-single-binary=symlinks

    PATH="$(pwd)/src:$PATH"
    make LN_S=ln -j $make_thrs

    (
        cd src

        (base64 -d | patch) << EOF
{% include 'uname.patch/base64' %}
EOF
    )

    make
    make install
}
