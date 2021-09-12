# url https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz
# md5 a6eb7fb1f2c21fa80030a47993853e92
# bld dev/build/make env/tools env/c env/bootstrap

build() {
    $untar $src/zstd* && cd zstd*

    (cd lib && make PREFIX=$out CC=gcc CXX=g++ -j $make_thrs install-static)
    (cd programs && make PREFIX=$out CC=gcc CXX=g++ -j $make_thrs install)

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lzstd \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
