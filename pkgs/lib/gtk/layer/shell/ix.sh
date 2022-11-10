{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wmww/gtk-layer-shell/archive/refs/tags/v0.8.0.tar.gz
sha:e95a03766302fe330ec3c6ff3e8018642849003ccaf160fb6fd0c039c81fa54c
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/gtk-layer-shell \${CPPFLAGS}"
{% endblock %}
