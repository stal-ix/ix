{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://musl.libc.org/releases/musl-1.2.2.tar.gz
# md5 aed8ae9e2b0898151b36a204088292dd
{% endblock %}

{% block deps %}
# dep env/c/nort boot/final/make boot/final/env
{% endblock %}

{% block postinstall %}
cd $out/lib
ar q libcrt.a crt1.o crti.o crtn.o
{% endblock %}

{% block env %}
export CPPFLAGS="-nostdinc -isystem $out/include \$CPPFLAGS"
export LDFLAGS="-static -nostdlib -nostdlib++ -L$out/lib -lcrt -lc \$LDFLAGS"
{% endblock %}

{% block test %}
. $out/env

gcc $CPPFLAGS $CFLAGS $LDFLAGS -x c -o main - << EOF
#include <stdio.h>

int main() {
    printf("hello!\n");

    return 0;
}
EOF

./main
{% endblock %}
