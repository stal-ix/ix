{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
reflection-cpp
{% endblock %}

{% block version %}
0.2.0
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/reflection-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3cf15cee33f39914a7d5c36347f0638bd39af210dcd3a07836300ab4aaf91250
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
