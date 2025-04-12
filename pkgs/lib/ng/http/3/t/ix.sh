{% extends '//die/c/cmake.sh' %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v{{self.version().strip()}}/nghttp3-{{self.version().strip()}}.tar.xz
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
