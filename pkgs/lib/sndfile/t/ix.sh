{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsndfile/libsndfile/releases/download/1.2.0/libsndfile-1.2.0.tar.xz
sha:0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_RUNTIME=ON
{% endblock %}
