{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Igalia/WPEBackend-fdo/archive/refs/tags/1.12.0.tar.gz
sha:7984e2c65b27ffc962417ee0f8a6ab5f7e4d2d175b515ba051fedbcef68932a4
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
bin/wayland/protocols
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/wpe-fdo-1.0 \${CPPFLAGS}"
{% endblock %}
