{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/1.41/wayland-protocols-1.41.tar.bz2
sha:0abbb958dd5b85fb5ab537b4c59cc0a51d1678179c4ca679b1b925605b467cba
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
