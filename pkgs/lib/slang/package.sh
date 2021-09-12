# url https://storage.yandexcloud.net/mix-cache/slang-2.3.2.tar.bz2
# md5 c2d5a7aa0246627da490be4e399c87cb
# lib lib/z lib/pcre lib/iconv lib/readline lib/oniguruma
# bld dev/build/make env/std

build() {
    $untar $src/slang* && cd slang*

    ln -s $(which dash) sh

    setup_compiler

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-readline=gnu \
        --without-png

    make install-static

    cat << EOF > $out/env
export SLANG_CFLAGS="-I$out/include"
export SLANG_LIBS="-L$out/lib -lslang"
export CPPFLAGS="\$SLANG_CFLAGS \$CPPFLAGS"
export LDFLAGS="\$SLANG_LIBS \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
