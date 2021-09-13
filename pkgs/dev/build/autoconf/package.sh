# url https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
# md5 12cfa1687ffa2606337efe1a64416106
# lib dev/lang/m4
# bld dev/lang/perl5 dev/build/make env/std

build() {
    $untar ${src}/autoconf* && cd autoconf*

    dash ./configure $COFLAGS --prefix=${out}
    make -j ${make_thrs}
    make install
}
