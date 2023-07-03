{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/1.32/wayland-protocols-1.32.tar.bz2
sha:3545331dd04f7ae481c8874d41259eeed3ca6bed510c79ce77bbd3761e71addb
{% endblock %}

{% block bld_tool %}
bld/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}

{% block env %}
export WL_PROTOCOL_DIR=${out}/share/wayland-protocols
{% endblock %}
