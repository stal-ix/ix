# dep boot/stage/3/env
{% include '//tool/gnu/coreutils/version.sh' %}

build() {
    $untar $src/coreutils-* && cd coreutils-*

    export CPPFLAGS="-I$(pwd)/lib $CPPFLAGS"

    setup_compiler

    dash ./configure $COFLAGS \
        --prefix="$out" \
        --libexecdir="$out/bin" \
        --without-gmp \
        --enable-no-install-program=stdbuf \
        --enable-single-binary=symlinks

    PATH="$(pwd)/src:$PATH"
    make LN_S=ln -j $make_thrs

{% if mix.platform.target.os == 'darwin' %}
    (
        cd src

        (base64 -d | patch) << EOF
{% include 'uname.patch/base64' %}
EOF
    )

    make
{% endif %}

    make install
}
