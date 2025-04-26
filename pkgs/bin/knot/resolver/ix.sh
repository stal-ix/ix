{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
knot-resolver
{% endblock %}

{% block version %}
6.0.12
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-{{self.version().strip()}}.tar.xz
sha:3215f3e9a7e9626cbd9f45a425b1e3734d32ab9a612d0d2aa5205e626c2fee9b
{% endblock %}

{% block bld_libs %}
lib/c
lib/uv
lib/knot
lib/edit
lib/gnutls
lib/kernel
lib/cap/ng
lib/lua/jit
lib/ng/http/2
lib/protobuf/c
{% endblock %}

{% block bld_tool %}
bld/bash
bin/protoc/c
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}
