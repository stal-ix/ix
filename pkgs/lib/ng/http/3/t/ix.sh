{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nghttp3
{% endblock %}

{% block version %}
1.18.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v{{self.version().strip()}}/nghttp3-{{self.version().strip()}}.tar.xz
aad782c23d3f01bd4bb52c8bac7a553b631ef8115fd1612703df6183449fef19
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=ON
ENABLE_SHARED_LIB=OFF
{% endblock %}

{% block cpp_defines %}
{{super()}}
NGHTTP3_STATICLIB=1
{% endblock %}
