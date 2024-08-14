{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v0.2.1.tar.gz
sha:061449c828d0cdaf7b147d9e232282fd0dde997c6ec7c43d51fe96d878b66c12
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pixman
{% endblock %}
