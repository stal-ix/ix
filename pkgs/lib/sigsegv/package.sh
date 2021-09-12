# url https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz
# md5 cf4a5fdc95e5494eaa190825af11f3be
# bld env/c boot/final/env

build() {
    $untar $src/lib* && cd lib*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lsigsegv \$LDFLAGS"
EOF
}
