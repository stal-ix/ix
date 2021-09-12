# url http://ftp.gnu.org/gnu/screen/screen-4.8.0.tar.gz
# md5 d276213d3acd10339cd37848b8c4ab1e
# bld lib/ncurses dev/build/make env/std

build() {
    $untar $src/screen* && cd screen*

    ln -s $(which dash) sh

    setup_compiler

    dash ./configure $COFLAGS \
        --prefix="$out" \
        --enable-colors256

    make -j $make_thrs
    make install
}
