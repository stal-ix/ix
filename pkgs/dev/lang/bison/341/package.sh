# url https://ftp.gnu.org/gnu/bison/bison-3.4.1.tar.xz
# md5 201286a573b12da109df96282fe4ff4a
# url https://storage.yandexcloud.net/mix-cache/bison-bootstrap-master.tar.bz2
# md5 425bbc1c4a21e708f05d35c62210f5ee
# bld lib/intl dev/lang/m4 dev/lang/flex dev/lang/perl5 dev/build/make env/std

build() {
    $untar $src/bison-3* && cd bison* && $untar $src/bison-b* && ln -s bison-b* bb

    cp src/parse-gram.y parse-gram.y.orig
    cp bb/parse-gram.y src/
    cp bb/parse-gram.c bb/parse-gram.h src/

    dash ./configure $COFLAGS --prefix=$out --enable-relocatable
    make
    touch src/parse-gram.y && rm src/parse-gram.c src/parse-gram.h
    make
    cp parse-gram.y.orig src/parse-gram.y && rm src/parse-gram.c src/parse-gram.h
    make
    make install
}
