{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nghttp3
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v{{self.version().strip()}}/nghttp3-{{self.version().strip()}}.tar.xz
sha:b1b531cf6ae5c9366abea2d3319e4ac932fd64c072c8aafd69cf6295733ce12a
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
