# url https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
# md5 9f16c976c25bb0f76b50be749cd7a3a8
# lib lib/gmp lib/mpfr
# bld dev/build/make env/std

build() {
    $untar $src/mpc* && cd mpc*

    dash ./configure $COFLAGS --prefix="$out"
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export COFLAGS="--with-mpc=$out \$COFLAGS"
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lmpc \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
