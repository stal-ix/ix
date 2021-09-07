# url https://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz
# md5 4c3d9ff35b2ab2fe518dc7eb3951e128
# dep lib/z lib/ncurses dev/build/make dev/build/pkg-config tool/text/gnu/patch tool/gnu/tar env/std

build() {
    $untar $src/emacs* && cd emacs*

    (base64 -d | patch -p1) << EOF
{% include 'p00.diff/base64' %}
EOF

    dash ./configure $COFLAGS \
        --prefix=$out \
        --without-all \
        --without-x \
        --with-dumping=pdumper \
        --without-ns

    make -j $make_thrs
    make install
}
