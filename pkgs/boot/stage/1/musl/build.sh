cd ${out} && $untar ${src}/musl* && cd musl*

(
    (while read l; do printf "$l\n"; done) << EOF
{% include 'alltypes.h' %}
EOF
) > arch/x86_64/bits/alltypes.h

(
    (while read l; do printf "$l\n"; done) << EOF
{% include 'syscall.h' %}
EOF
) > arch/x86_64/bits/syscall.h

(
    (while read l; do printf "$l\n"; done) << EOF
#define VERSION "bootstrap"
EOF
) > src/internal/version.h

>include/sys/cdefs.h
>include/sys/sysctl.h

export MFLAGS="$MFLAGS -iquote ${PWD}/arch/x86_64"
export MFLAGS="$MFLAGS -iquote ${PWD}/src/internal"
export MFLAGS="$MFLAGS -isystem ${PWD}/arch/x86_64"
export MFLAGS="$MFLAGS -isystem ${PWD}/arch/generic"
export MFLAGS="$MFLAGS -isystem ${PWD}/src/include"
export MFLAGS="$MFLAGS -isystem ${PWD}/src/internal"
export MFLAGS="$MFLAGS -isystem ${PWD}/include"

export CFLAGS="-w $MFLAGS -D__STDC_HOSTED__ -D_XOPEN_SOURCE=700 -U_GNU_SOURCE ${CPPFLAGS} -ffreestanding -nostdinc -std=c99 ${CFLAGS}"

objs=""

for i in src/*; do
    for s in $i/*.c; do
        case $s in
            *\*.c)
            ;;
            *)
                set +x
                objs="$s.o $objs"
                set -x
                gcc ${CFLAGS} $s -c -o $s.o
            ;;
        esac
    done

    for s in $i/x86_64/*.s; do
        case $s in
            *\*.s)
            ;;
            *)
                set +x
                objs="$s.o $objs"
                set -x
                gcc ${CFLAGS} $s -c -o $s.o
            ;;
        esac
    done
done

for s in src/malloc/mallocng/*.c; do
    set +x
    objs="$s.o $objs"
    set -x
    gcc ${CFLAGS} $s -c -o $s.o
done

for s in crt/x86_64/*.s crt/crt1.c; do
    gcc ${CFLAGS} $s -c -o $s.o
    set +x
    objs="$s.o $objs"
    set -x
done

ar q libmusl.a $objs
ranlib libmusl.a

gcc ${CFLAGS} ${LDFLAGS} ./libmusl.a -o tool -x c - << EOF
#include <stdio.h>
#include <errno.h>

int main() {
    char buf[1024];
    ssize_t n;

    while ((n = fread(buf, 1, sizeof(buf), stdin)) > 0) {
        fwrite(buf, 1, n, stdout);
    }

    exit(errno = 0);
}
EOF

>empty.c

clang -o empty.o -c ./empty.c

for x in m pthread dl; do
    ar q lib${x}.a empty.o
    ranlib lib${x}.a
done

./tool << EOF > ${out}/env
export CPPFLAGS="$MFLAGS \${CPPFLAGS}"
export CFLAGS="-ffreestanding -nostdinc \${CFLAGS}"
export LDFLAGS="-static -nostdlib -nostdlib++ -L${PWD} -lmusl \${LDFLAGS}"
EOF
