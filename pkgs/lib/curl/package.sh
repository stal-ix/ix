# url https://github.com/curl/curl/releases/download/curl-7_78_0/curl-7.78.0.tar.xz
# md5 419c2461366cf404160a820f7a902b7e
# lib lib/z lib/idn2 lib/zstd lib/brotli lib/nghttp2 lib/openssl
{% if mix.platform.target.os == 'darwin' %}
# lib sys/framework/SystemConfiguration
{% endif %}
# bld dev/build/make dev/build/pkg-config env/std

build() {
    $untar $src/curl* && cd curl*

    export LIBS=$(echo "$LDFLAGS" | tr ' ' '\n' | grep '^-l' | tr '\n' ' ')

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lcurl \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DCURL_LIBRARY=$out/lib/libcurl.a -DCURL_INCLUDE_DIR=$out/include \$CMFLAGS"
EOF
}
