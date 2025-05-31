{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
knot-resolver
{% endblock %}

{% block version %}
6.0.13
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-{{self.version().strip()}}.tar.xz
sha:5e00f10948cc6c8b3eb22ff58fbd6f101f4b92a44e9e760d98519ada1076259f
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
