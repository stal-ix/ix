# url https://ftp.gnu.org/gnu/bison/bison-3.5.1.tar.xz
# md5 6fc5fa4488832a65db934b9e93bd5d4c
# bld lib/intl dev/lang/m4 dev/lang/flex dev/lang/perl5 dev/lang/bison/341 dev/build/make env/std

build() {
    $untar ${src}/bison* && cd bison*

    dash ./configure $COFLAGS --prefix=${out} --enable-relocatable

    (
        cd src

        rm parse-gram.c parse-gram.h
        cat parse-gram.y | grep -v 'define api.token.raw' > qw && mv qw parse-gram.y
        bison parse-gram.y
        mv parse-gram.tab.c parse-gram.c && mv parse-gram.tab.h parse-gram.h
    )

    make -j ${make_thrs}
    make install
}
