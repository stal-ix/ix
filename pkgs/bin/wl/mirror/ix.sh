{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Ferdi265/wl-mirror/archive/refs/tags/v0.11.2.tar.gz
sha:5734cde2425a58d7d19f91815c3f49114bd55d7334e499830719360239071c7a
https://gitlab.freedesktop.org/wlroots/wlr-protocols/-/archive/0c7437e2b600382f0be33949c4e244b2a3702fcb/wlr-protocols-0c7437e2b600382f0be33949c4e244b2a3702fcb.tar.bz2
sha:f71031f8a4450c4eee3577507a43db4a4714ac37bd77dd2ba2c4eca21292c2ea
{% endblock %}

{% block unpack %}
{{super()}}
(cd proto/wlr-protocols; extract 1 ${src}/wlr*)
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/mesa/egl
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block cmake_flags %}
WL_PROTOCOL_DIR=${bin_wayland_protocols}/share/wayland-protocols
FORCE_SYSTEM_WL_PROTOCOLS=ON
WLR_PROTOCOL_DIR=${PWD}/proto/wlr-protocols
FORCE_SYSTEM_WLR_PROTOCOLS=ON
{% endblock %}
