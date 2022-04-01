{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2022-04-01.tar.gz
sha:
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
RE2_BUILD_TESTING=OFF
{% endblock %}
