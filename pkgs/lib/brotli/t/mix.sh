{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/google/brotli/archive/refs/tags/v1.0.9.tar.gz
sha:6b7f9c809acff4f0877e2e7722e02a08f2e17e06c6e2e8c84081631d15490009
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BROTLI_SHARED_LIBS=
BROTLI_DISABLE_TESTS=ON
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/lib*static*
{% endblock %}
