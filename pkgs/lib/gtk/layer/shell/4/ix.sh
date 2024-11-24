{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wmww/gtk4-layer-shell/archive/refs/tags/v1.0.4.tar.gz
sha:7fe327dc3740e4b6f5edfd855e23f84b1ac1ec6854b731047b95df7feb46498b
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/4
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block c_rename_symbol %}
wl_proxy_add_dispatcher
wl_proxy_destroy
wl_proxy_marshal
wl_proxy_marshal_array
wl_proxy_marshal_array_constructor
wl_proxy_marshal_array_constructor_versioned
wl_proxy_marshal_array_flags
wl_proxy_marshal_constructor
wl_proxy_marshal_constructor_versioned
wl_proxy_marshal_flags
{% endblock %}
