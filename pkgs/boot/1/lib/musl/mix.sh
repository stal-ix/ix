{% extends '//mix/template/py.py' %}

{% block fetch %}
https://musl.libc.org/releases/musl-1.2.2.tar.gz
aed8ae9e2b0898151b36a204088292dd
{% endblock %}

{% block lib_deps %}
lib/build/mix.sh
{% endblock %}

{% block bld_libs %}
lib/build/mix.sh
{% endblock %}

{% block bld_deps %}
boot/0/env/mix.sh
{% endblock %}

{% block script %}
cd ${out} && ${untar} ${src}/musl* && cd musl*

setup_compiler
setup_ar

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

export MFLAGS="${MFLAGS} -iquote ${PWD}/arch/x86_64"
export MFLAGS="${MFLAGS} -iquote ${PWD}/src/internal"
export MFLAGS="${MFLAGS} -isystem ${PWD}/arch/x86_64"
export MFLAGS="${MFLAGS} -isystem ${PWD}/arch/generic"
export MFLAGS="${MFLAGS} -isystem ${PWD}/src/include"
export MFLAGS="${MFLAGS} -isystem ${PWD}/src/internal"
export MFLAGS="${MFLAGS} -isystem ${PWD}/include"

export CFLAGS="-w ${MFLAGS} -D__STDC_HOSTED__ -D_XOPEN_SOURCE=700 -U_GNU_SOURCE ${CPPFLAGS} -ffreestanding -std=c99 ${CFLAGS}"

objs=""

for i in src/*; do
    for s in $i/*.c; do
        case $s in
            *\*.c)
            ;;
            *)
                objs="$s.o $objs"
                ${CC} ${CFLAGS} $s -c -o $s.o
            ;;
        esac
    done

    for s in $i/x86_64/*.s; do
        case $s in
            *\*.s)
            ;;
            *)
                objs="$s.o $objs"
                ${CC} ${CFLAGS} $s -c -o $s.o
            ;;
        esac
    done
done

for s in src/malloc/mallocng/*.c; do
    objs="$s.o $objs"
    ${CC} ${CFLAGS} $s -c -o $s.o
done

for s in crt/x86_64/*.s crt/crt1.c; do
    ${CC} ${CFLAGS} $s -c -o $s.o
    objs="$s.o $objs"
done

${AR} q libmusl.a $objs
${RANLIB} libmusl.a

>empty.c

${CC} -o empty.o -c ./empty.c

for x in m pthread dl; do
    ${AR} q lib${x}.a empty.o
    ${RANLIB} lib${x}.a
done

${CC} ${CFLAGS} -c -o tool.o -x c - << EOF
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

${CC} -static -nostdlib ${LDFLAGS} -L${PWD} tool.o -lmusl -o tool

./tool << EOF > ${out}/env
export CPPFLAGS="${MFLAGS} \${CPPFLAGS}"
export LDFLAGS="-static -nostdlib -L${PWD} -lmusl \${LDFLAGS}"
EOF
{% endblock %}
