{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://secure.nic.cz/files/knot-resolver/knot-resolver-5.6.0.tar.xz
sha:0c82ae937b685dc477fb3176098e3dc106c898b7cd83553e5bc54dccb83c80d7
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
bin/protoc/c
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}
