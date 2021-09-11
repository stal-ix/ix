# url https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
# md5 097ff1a324ae02e0a3b0369f07a7544a
# dep lib/intl lib/iconv env/c boot/final/env

build() {
    $untar $src/which* && cd which*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
