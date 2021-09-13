# url https://github.com/nghttp2/nghttp2/releases/download/v1.43.0/nghttp2-1.43.0.tar.xz
# md5 c1d607bf3830000acd7a51f0058f4bd2
# lib lib/z lib/c-ares lib/openssl
# bld dev/build/make dev/build/pkg-config env/std

build() {
    $untar ${src}/nghttp2* && cd nghttp2*

    dash ./configure ${COFLAGS} \
        --prefix=${out} \
        --enable-lib-only

    make -j ${make_thrs}
    make install

    cat << EOF > ${out}/env
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lnghttp2 \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
