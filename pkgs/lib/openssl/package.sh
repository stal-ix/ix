# url https://www.openssl.org/source/old/1.1.1/openssl-1.1.1j.tar.gz
# md5 cccaa064ed860a2b4d1303811bf5c682
# dep dev/build/make dev/lang/perl5 env/std

build() {
    $untar $src/openssl* && cd openssl*

    export AR=ar
    export RANLIB=ranlib

    setup_compiler

    perl ./Configure \
        {{mix.platform.target.os}}{{mix.platform.target.bits}}-{{mix.platform.target.arch}}-cc \
        no-asm \
        threads \
        no-shared \
        no-dso \
        no-hw \
        no-tests \
        --prefix="$out" \
        --openssldir="$out"

    make -j $make_thrs
    make install

    cat << EOF > $out/env
export COFLAGS="--with-openssl=$out --with-openssldir=$out --with-ssl-dir=$out \$COFLAGS"
export OPENSSL_INCLUDES="-I$out/include"
export OPENSSL_LIBS="-L$out/lib -lssl -lcrypto"
export OPENSSL_DIR="$out"
export CPPFLAGS="\$OPENSSL_INCLUDES \$CPPFLAGS"
export LDFLAGS="\$OPENSSL_LIBS \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DOPENSSL_ROOT_DIR=$out -DOPENSSL_INCLUDE_DIR=$out/include \$CMFLAGS"
EOF
}
