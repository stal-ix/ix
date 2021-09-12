# url https://invisible-island.net/datafiles/release/byacc.tar.gz
# md5 ad027e9a1a78666e3e27924ce6854f97
# bld dev/build/make env/std

build() {
    $untar $src/byacc* && cd byacc*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install

    (
        cd $out/bin && ln -s yacc byacc
    )
}
