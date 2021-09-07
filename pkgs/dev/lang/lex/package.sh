# url https://github.com/pg83/heirloom/archive/a47c4acf9fb43b89f9fb0afdcf9008121d50d806.zip
# md5 19b59804cf21bf9bd266d9cb261ecb2c
# dep dev/build/make dev/lang/byacc env/std

build() {
    $untar $src/*.zip && cd heirloom* && cd heirloom-devtools/lex

    export CFLAGS="-w $CFLAGS"

    setup_compiler

    export ROOT=

    export BINDIR="$out/bin"
    export LIBDIR="$out/lib"
    export MANDIR="$out/man"

    make -f Makefile.mk CC=gcc AR=ar RANLIB=ranlib
    make -f Makefile.mk INSTALL=install STRIP=true install
}
