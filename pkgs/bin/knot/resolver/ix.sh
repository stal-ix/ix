{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
knot-resolver
{% endblock %}

{% block version %}
6.2.0
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-{{self.version().strip()}}.tar.xz
b44633bc843180c0bc7c77cf7b15fe571243ae992b4ddb74afdee4cfa803701b
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
