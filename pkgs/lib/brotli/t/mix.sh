{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/google/brotli/archive/refs/tags/v1.0.9.tar.gz
sha:f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46
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
