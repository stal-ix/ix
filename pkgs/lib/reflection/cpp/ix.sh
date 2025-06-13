{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
reflection-cpp
{% endblock %}

{% block version %}
0.4.0
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/reflection-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
898e0d653860f996b0b4881d3715a4d236a25e3e82548426c6079ed5192fea08
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
