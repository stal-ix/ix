{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtk4-layer-shell
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://github.com/wmww/gtk4-layer-shell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4e04711fec80afbcd0a1e6e39c07ae263d2c3400181791b7826f3e5317b33567
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
