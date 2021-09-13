# url https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
# md5 2acf2ef147e41730e572251ed079bc1a
# bld lib/z lib/gdbm lib/iconv dev/build/make tool/gnu/coreutils shell/bash/minimal env/std

build() {
    $untar ${src}/perl* && cd perl*

    # too much warnings with clang
    export CPPFLAGS="-w $CPPFLAGS"

    echo > empty.c
    gcc -c empty.c -o empty.o
    ar q libdl.a empty.o

    cat << EOF > install_name_tool
#!$(which dash)
EOF

    chmod +x install_name_tool

    ln -s $(which bash) sh

    export PATH="$(pwd):$PATH"
    export LDFLAGS="-L$(pwd) $LDFLAGS"

    setup_compiler

    bash ./Configure -des \
        -Dusethreads \
        -Dprefix="${out}" \
        -Duseperlio \
        -Uusesfio \
        -Duseshrplib=false \
        -Dusedl=false \
        -Dcc=gcc
#        -Duserelocatableinc

    make -j ${make_thrs}
    make install
}
