{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
knot-resolver
{% endblock %}

{% block version %}
6.4.2
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-{{self.version().strip()}}.tar.xz
854ad23367bab66392f7d74f142f2219e3090ae81126b635430fce7b1916f1a3
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
