# url https://www.mpfr.org/mpfr-current/mpfr-4.1.0.tar.xz
# md5 bdd3d5efba9c17da8d83a35ec552baef
# lib lib/gmp
# bld dev/build/make env/std

build() {
    $untar ${src}/mpfr* && cd mpfr*

    dash ./configure $COFLAGS --prefix="${out}"

    make -j ${make_thrs}
    make install

    cat << EOF > ${out}/env
export COFLAGS="--with-mpfr=${out} \$COFLAGS"
export CPPFLAGS="-I${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -lmpfr \$LDFLAGS"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
