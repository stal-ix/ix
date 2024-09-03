{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-5.7.4.tar.xz
sha:6b6da6ecf06828041afad44dfa227781f0ae34ad183a667008509355d18bd9c8
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
bld/shebangs
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block patch %}
fix_shebangs scripts/get-date.sh
{% endblock %}
