{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprlang
{% endblock %}

{% block version %}
0.6.8
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d10a0778b646e04d83e8b90cc0f764fb96958c01a15c3c0678d95a40fc647ed5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/hypr/utils
{% endblock %}
