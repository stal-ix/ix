{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v0.2.4.tar.gz
sha:ce8455a7bb74e2266910f9a3c1fcbcc9fa4317ca057ba6e8fbf79ec95c8ef699
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pixman
{% endblock %}
