{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hypridle/archive/refs/tags/v0.1.4.tar.gz
sha:4a878917be65ab2df24f9036846339610861b845b9f1bb9ca0bdffdc1e368050
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
