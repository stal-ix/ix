{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v0.5.1.tar.gz
sha:7f521906d3f40b8d7b2bfcbe29a8286e9c65a7a601994344278bc16325bbd75d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
