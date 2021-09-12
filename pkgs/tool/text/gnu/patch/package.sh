# url https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
# md5 78ad9937e4caadcba1526ef1853730d5
# bld lib/intl lib/iconv env/c boot/final/env

build() {
    $untar $src/patch* && cd patch*

    ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
