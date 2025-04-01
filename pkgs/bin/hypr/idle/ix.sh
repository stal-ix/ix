{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hypridle/archive/refs/tags/v0.1.6.tar.gz
sha:ea4faf92e7ef303a538551e2b0ea67a557b2d711574993a5a3fea3b27667dc63
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
bin/hypr/wayland/scanner
bin/hypr/wayland/protocols
{% endblock %}
