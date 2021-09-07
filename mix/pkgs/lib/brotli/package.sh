# url https://github.com/google/brotli/archive/refs/tags/v1.0.9.tar.gz
# md5 c2274f0c7af8470ad514637c35bcee7d
# dep dev/build/make env/tools env/c env/bootstrap

build() {
    $untar $src/v* && cd brotli*

    make CC=gcc -j $make_thrs lib
    cp -R ./c/include $out/
    mkdir $out/lib && cp libbrotli.a $out/lib/

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lbrotli \$LDFLAGS"
EOF
}
