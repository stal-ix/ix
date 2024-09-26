{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v0.2.3.tar.gz
sha:06821949c3a060c6233bebcaad3a3a3e3a6dfc4b2e6e1034834a5c92d7236b21
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pixman
{% endblock %}
