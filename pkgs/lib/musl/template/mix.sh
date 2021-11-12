{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://musl.libc.org/releases/musl-1.2.2.tar.gz
aed8ae9e2b0898151b36a204088292dd
{% endblock %}

{% block install %}
{{super()}}

cat << EOF > ${out}/include/error.h
#pragma once

#include <err.h>

#define error(status, errno, ...) err(status, __VA_ARGS__)
EOF

(
    set -eu

    cd ${out}/lib

    ar q libcrt.a crt1.o crti.o crtn.o
    ranlib libcrt.a
)
{% endblock %}

{% block env %}
export CMFLAGS="-DLIBCXX_HAS_MUSL_LIBC=yes \${CMFLAGS}"
export CPPFLAGS="-isystem ${out}/include \${CPPFLAGS}"
{% endblock %}

{% block test %}
. ${out}/env

clang ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -x c -o main - << EOF
#include <stdio.h>

int main() {
    printf("hello!\n");

    return 0;
}
EOF

./main
{% endblock %}
