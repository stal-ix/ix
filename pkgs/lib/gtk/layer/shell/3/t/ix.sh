{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wmww/gtk-layer-shell/archive/refs/tags/v0.9.0.tar.gz
sha:3809e5565d9ed02e44bb73787ff218523e8760fef65830afe60ea7322e22da1c
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
