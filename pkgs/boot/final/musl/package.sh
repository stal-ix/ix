# url https://musl.libc.org/releases/musl-1.2.2.tar.gz
# md5 aed8ae9e2b0898151b36a204088292dd
# dep boot/final/make boot/stage/6/env

build() {
    $untar $src/musl* && cd musl*

    setup_compiler

    dash ./configure --prefix="$out"
    make -j $make_thrs
    make install

    (
        cd $out/lib

        ar q libcrt.a crt1.o crti.o crtn.o
    )

    cat << EOF > $out/env
export CPPFLAGS="-nostdinc -isystem $out/include \$CPPFLAGS"
export LDFLAGS="-static -nostdlib -nostdlib++ -L$out/lib -lcrt -lc \$LDFLAGS"
EOF

    (
        . $out/env

        gcc $CPPFLAGS $CFLAGS $LDFLAGS -x c -o main - << EOF
#include <stdio.h>

int main() {
    printf("hello!\n");

    return 0;
}
EOF

        ./main
    )
}
