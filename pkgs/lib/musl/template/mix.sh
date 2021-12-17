{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://musl.libc.org/releases/musl-1.2.2.tar.gz
aed8ae9e2b0898151b36a204088292dd
{% endblock %}

{% block lib_deps %}
lib/build/mix.sh
{% endblock %}

{% block configure_script %}
./configure
{% endblock %}

{% block setup %}
export PICFLAGS="-fno-pic -fno-pie"
export CPPFLAGS="${PICFLAGS} ${CPPFLAGS}"
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
export CPPFLAGS="${PICFLAGS} -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}

{% block test_lib %}
. ${out}/env

cat << EOF > main.c
#include <stdio.h>

int main() {
    printf("hello!\n");
    exit(0);
}
EOF

${CC} -o main main.c ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}
{% endblock %}

{% block test_execute %}
./main
{% endblock %}
