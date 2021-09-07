# url https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
# md5 c27f608a4e1f302ec7ce42f1251c184e
# dep dev/lang/perl5 dev/build/autoconf dev/build/make env/std

build() {
    $untar $src/automake* && cd automake*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
