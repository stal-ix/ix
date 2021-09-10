{% if mix.platform.target.os == 'linux' %}
# dep boot/lib/linux
{% endif %}
# dep boot/lib/compiler_rt
# dep boot/stage/5/env
{% include '//dev/lang/python3/version.sh' %}

build() {
    $untar $src/Python* && cd Python*

    setup_compiler

    sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' -i ./configure

    sed -e 's|/usr|/eat/shit|' -i ./configure
    sed -e 's|/usr|/eat/shit|' -i ./setup.py
    sed -e 's|/usr|/eat/shit|' -i ./Makefile.pre.in

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-ensurepip=no

    make -j $make_thrs
    make install
}
