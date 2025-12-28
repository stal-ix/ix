{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nghttp3
{% endblock %}

{% block version %}
1.14.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/releases/download/v{{self.version().strip()}}/nghttp3-{{self.version().strip()}}.tar.xz
b3083dae2ff30cf00d24d5fedd432479532c7b17d993d384103527b36c1ec82d
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
