{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/highway/archive/refs/tags/1.0.7.tar.gz
sha:5434488108186c170a5e2fca5e3c9b6ef59a1caa4d520b008a9b8be6b8abe6c5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
HWY_ENABLE_EXAMPLES=OFF
{% endblock %}
