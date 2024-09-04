{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v1.5.0/nghttp3-1.5.0.tar.xz
sha:8c00e3910ea2ad1218dafebcf8dd2ffdf030c992d9ceb65834d29e5e5278dd0d
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
