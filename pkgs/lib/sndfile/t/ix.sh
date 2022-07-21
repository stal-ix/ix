{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsndfile/libsndfile/releases/download/1.1.0/libsndfile-1.1.0.tar.xz
sha:0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_RUNTIME=ON
{% endblock %}
