{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lerc
{% endblock %}

{% block version %}
4.3.0
{% endblock %}

{% block fetch %}
https://github.com/Esri/lerc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
28d74992e0bc0f13ecdda1dd9ca3b40b1a87009369b9ec5a599853f6f311fee7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cpp_missing %}
limits.h
{% endblock %}
