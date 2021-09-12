# url https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
# md5 28b1cd4c94a74428723ed966c38cf479
# lib lib/iconv
# bld dev/build/make env/std

build() {
    $untar $src/gettext* && cd gettext* && cd libtextstyle

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -ltextstyle \$LDFLAGS"
export COFLAGS="--with-libtextstyle-prefix=$out \$COFLAGS"
EOF
}
