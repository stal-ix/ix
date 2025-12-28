{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
knot-resolver
{% endblock %}

{% block version %}
6.0.17
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-{{self.version().strip()}}.tar.xz
13d4496ef87aeb2fbd3b0057e2211d4585205241e509a0cd4341dbe5e8cb5c1c
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
