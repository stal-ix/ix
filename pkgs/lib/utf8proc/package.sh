# url https://github.com/JuliaStrings/utf8proc/archive/v2.6.1.tar.gz
# md5 9fe61625c105f911a2c89423f071ef1d
# bld dev/build/make env/std

build() {
    $untar $src/v* && cd utf8proc*

    make CC=gcc prefix=$out -j $make_thrs install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lutf8proc \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
