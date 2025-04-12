{% extends '//die/c/meson.sh' %}

{% block version %}
1.1.1
{% endblock %}

{% block fetch %}
https://github.com/wmww/gtk4-layer-shell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:5db158d570e28f56625d5fb2022bc487c0f1b1b21a965702e461a5a5a049a439
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
