{% extends '//util/cmake.sh' %}

{% block fetch %}
# url https://github.com/microsoft/mimalloc/archive/refs/tags/v2.0.2.tar.gz
# md5 40c75843e55e5c02d47fc5b1fda30124
{% endblock %}

{% block deps %}
{% if mix.platform.target.os == 'linux' %}
# dep lib/musl
{% endif %}
# dep env/c/nort boot/final/cmake boot/final/env
{% endblock %}

{% block cmflags %}
-DMI_OVERRIDE=ON -DMI_BUILD_STATIC=ON -DMI_BUILD_SHARED=OFF -DMI_BUILD_TESTS=OFF ..
{% endblock %}

{% block env %}
export LDFLAGS="-L$out/lib/mimalloc-2.0 -lmimalloc \$LDFLAGS"
{% endblock %}

{% block test %}
. $out/env

gcc $CPPFLAGS $CFLAGS $LDFLAGS -o main -x c - << EOF
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
