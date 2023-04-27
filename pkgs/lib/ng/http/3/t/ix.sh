{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/nghttp3/archive/refs/tags/v0.11.0.tar.gz
sha:70d6e4e9fc4ae1ec95fd67507111a08e6e3b7318b844e45e42a259752ae4228f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=OFF
{% endblock %}
