# url https://www.sourceware.org/pub/bzip2/bzip2-latest.tar.gz
# md5 67e051268d0c475ea773822f7500d0e5
# dep dev/build/make env/tools env/c env/bootstrap

build() {
    $untar $src/bz* && cd bz*

    setup_compiler

    make -j $make_thrs PREFIX="$out" install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lbz2 \$LDFLAGS"
EOF
}
