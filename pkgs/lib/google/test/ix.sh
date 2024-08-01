{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz
sha:7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
