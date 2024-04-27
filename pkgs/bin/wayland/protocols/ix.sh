{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/1.36/wayland-protocols-1.36.tar.bz2
sha:e6830b04c19f6aa76c7e9cc91d5dd442f6df6f7b1e43ac62f7b04daf95b01737
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
