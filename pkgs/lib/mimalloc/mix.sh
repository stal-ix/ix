{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v2.0.3.tar.gz
a06e57e9ae10a346ab8a1097c0838fef
{% endblock %}

{% block bld_libs %}
lib/c++/headers/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block cmake_flags %}
MI_USE_CXX=ON
MI_OVERRIDE=ON
MI_BUILD_STATIC=ON
MI_BUILD_SHARED=OFF
MI_BUILD_TESTS=OFF
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

mv mimalloc-*/* ./
rm -rf mimalloc-*
{% endblock %}

{% block test_lib1 %}
. ${out}/env

clang ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -o main -x c - << EOF
#include <stdlib.h>
#include <locale.h>

int main() {
    free(malloc(1));
    freelocale(0);
    free(realloc(0, 100));

    return 0;
}
EOF
{% endblock %}

{% block test_execute %}
#./main
{% endblock %}
