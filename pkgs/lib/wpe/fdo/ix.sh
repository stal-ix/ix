{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Igalia/WPEBackend-fdo/archive/refs/tags/1.14.0.tar.gz
sha:90755742c38f24dd8c0372c3e538f8c4a502f5a4660d8717e0663cdcade3be1d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
lib/epoxy
lib/wayland
lib/wpe/loader
{% endblock %}

{% block c_rename_symbol %}
zwp_linux_dmabuf_v1_interface
zwp_linux_buffer_params_v1_interface
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
bld/wayland
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/wpe-fdo-1.0 \${CPPFLAGS}"
{% endblock %}
