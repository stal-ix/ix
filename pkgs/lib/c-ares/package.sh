# url https://c-ares.haxx.se/download/c-ares-1.17.2.tar.gz
# md5 3802264830c6886411dac606c66fdbf8
# bld dev/build/make env/std

build() {
    $untar ${src}/c* && cd c*

    dash ./configure $COFLAGS \
        --prefix=${out} \
        --disable-tests

    make -j ${make_thrs}
    make install

    cat << EOF > ${out}/env
export CPPFLAGS="-I${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -lresolv -lcares \$LDFLAGS"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
