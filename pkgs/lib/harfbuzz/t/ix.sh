{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/10.1.0.tar.gz
sha:c758fdce8587641b00403ee0df2cd5d30cbea7803d43c65fddd76224f7b49b88
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/python
bin/ragel/6
{% endblock %}

{% block meson_flags %}
glib=enabled
gobject=enabled
tests=disabled
docs=disabled
{% endblock %}
