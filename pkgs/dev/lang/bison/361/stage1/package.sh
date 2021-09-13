# url https://ftp.gnu.org/gnu/bison/bison-3.6.1.tar.xz
# md5 16fa3e60f2c33888c6ef7af64c89e182
# bld lib/intl dev/lang/m4 dev/lang/flex dev/lang/perl5 dev/lang/bison/361/stage0 dev/build/make env/std

build() {
    $untar ${src}/bison* && cd bison*

    dash ./configure ${COFLAGS} --prefix=${out} --enable-relocatable

    (
        cd src

        rm parse-gram.c parse-gram.h
        bison parse-gram.y
        mv parse-gram.tab.c parse-gram.c
        mv parse-gram.tab.h parse-gram.h
    )

    make -j ${make_thrs}
    make install
}
