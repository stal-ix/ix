{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprlang
{% endblock %}

{% block version %}
0.6.4
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cd7395eaeb1eee90ebeba9c1330a7635709dd0900ebbe349a7aa5702ba4d613f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/hypr/utils
{% endblock %}
