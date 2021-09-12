# bld lib/glib lib/iconv env/std boot/final/env
{% include 'version.sh' %}

build() {
    $untar $src/pkg* && cd pkg*

    ln -s $(which dash) sh
    export PATH="$(pwd):$PATH"

    setup_compiler

    dash ./configure $COFLAGS --prefix=$out --disable-host-tool
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export PKG_CONFIG="$out/bin/pkg-config"
EOF
}
