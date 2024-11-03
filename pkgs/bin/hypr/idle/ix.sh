{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hypridle/archive/refs/tags/v0.1.5.tar.gz
sha:174d4b4706ec5c79e6d80a7cc3b297b5564c923f60f408c1638b55424a998a4b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/wayland
lib/hypr/lang
lib/sd/bus/c++/2
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
