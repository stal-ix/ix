{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v2.0.2.tar.gz
40c75843e55e5c02d47fc5b1fda30124
{% endblock %}

{% block bld_deps %}
{{'lib/musl/mix.sh' | linux}}
env/c/nort/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}

{% block cmflags %}
-DMI_OVERRIDE=ON
-DMI_BUILD_STATIC=ON
-DMI_BUILD_SHARED=OFF
-DMI_BUILD_TESTS=OFF
{% endblock %}

{% block postinstall %}
cd ${out}/lib
mv mimalloc-*/* ./
rm -rf mimalloc-*
{% endblock %}

{% block test %}
. ${out}/env

gcc ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -o main -x c - << EOF
#include <stdlib.h>
#include <locale.h>

int main() {
    free(malloc(1));
    freelocale(0);
    free(realloc(0, 100));

    return 0;
}
EOF

./main
{% endblock %}
