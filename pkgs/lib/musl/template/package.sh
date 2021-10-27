{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://musl.libc.org/releases/musl-1.2.2.tar.gz
# md5 aed8ae9e2b0898151b36a204088292dd
{% endblock %}

{% block postinstall %}
{% block musl_postinstall %}
{% endblock %}

cat << EOF > ${out}/include/sys/cdefs.h
EOF

cat << EOF > ${out}/include/error.h
#pragma once

#include <err.h>

#define error(status, errno, ...) err(status, __VA_ARGS__)
EOF

cd ${out}/lib

ar q libcrt.a crt1.o crti.o crtn.o
ranlib libcrt.a
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem ${out}/include \${CPPFLAGS}"
{% endblock %}

{% block test %}
. ${out}/env

gcc ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -x c -o main - << EOF
#include <stdio.h>

int main() {
    printf("hello!\n");

    return 0;
}
EOF

./main
{% endblock %}
