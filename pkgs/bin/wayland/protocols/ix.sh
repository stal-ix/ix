{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/1.39/wayland-protocols-1.39.tar.bz2
sha:5778d7a99a7ef34d4ee2e4e2896236311fa49a3fb3dd01f358e508637cafe657
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
