{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/wmww/gtk-layer-shell/archive/refs/tags/v0.7.0.tar.gz
sha:ac6016f232c5b0551e5106a7652751cfc56b5a1895a723ff931fbc7019acfc47
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}
