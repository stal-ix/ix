{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://musl.libc.org/releases/musl-1.2.2.tar.gz
# md5 aed8ae9e2b0898151b36a204088292dd
{% endblock %}

{% block deps %}
# bld env/c/nort boot/final/env
{% endblock %}

{% block cflags %}
export CPPFLAGS="-D__libc_realloc=realloc -D__libc_free=free -D__libc_malloc=malloc -D__libc_calloc=calloc $CPPFLAGS"
>src/malloc/lite_malloc.c
{% endblock %}

{% block postinstall %}
{% block relinkmusl %}
ar q ${out}/lib/libmuslalloc.a $(find obj/src/malloc -type f | sort)
ranlib ${out}/lib/libmuslalloc.a

rm -rf obj/src/malloc

ar q ${out}/lib/libmusl.a $(find obj -type f | sort)
ranlib ${out}/lib/libmusl.a
{% endblock %}

cd ${out}/lib

ar q libcrt.a crt1.o crti.o crtn.o
ranlib libcrt.a
{% block extractalloc %}
rm libc.a && mv libmusl.a libc.a
{% endblock %}
{% endblock %}

{% block env %}
export CPPFLAGS="-nostdinc -isystem ${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -lcrt -lc \$LDFLAGS"
{% endblock %}

{% block test %}
. ${out}/env

gcc $CPPFLAGS $CFLAGS $LDFLAGS -x c -o main - << EOF
#include <stdio.h>

int main() {
    printf("hello!\n");

    return 0;
}
EOF

./main
{% endblock %}
