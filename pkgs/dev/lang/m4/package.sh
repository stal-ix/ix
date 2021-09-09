# url https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
# md5 0d90823e1426f1da2fd872df0311298d
# url https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch
# md5 319c143996239e23d2fe3e7968a7620d
# dep lib/intl lib/sigsegv dev/build/make dev/build/help2man env/std

build() {
    $untar $src/m4* && cd m4*

    #patch -p0 < $src/secure_snprintf.patch

    dash ./configure $COFLAGS --prefix=$out --disable-c++
    make -j $make_thrs
    make install
}
