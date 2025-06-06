{% extends '//lib/musl/pure/ix.sh' %}

{% block step_install %}
{{super()}}

. ${out}/env

cat << EOF > main.c
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("hello!\n");
    exit(0);
}
EOF

${CC} -o main main.c ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}

./main
{% endblock %}
