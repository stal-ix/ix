{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
reflection-cpp
{% endblock %}

{% block version %}
0.3.0
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/reflection-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:2c8a520c3e69a874e78b0ca50f8e0254cd30fbeca9e6b965567a72ef6ba17ff6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
