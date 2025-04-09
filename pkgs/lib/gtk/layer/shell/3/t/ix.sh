{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wmww/gtk-layer-shell/archive/refs/tags/v0.9.1.tar.gz
sha:43e2165cf1a9aa8a317b081c2a583648e02389162f1fbbd33836ba27f9ca19fa
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
