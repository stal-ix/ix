{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.48.0.tar.gz
sha:946a8fa490548b67fc6074553cb225279cc6404bae96cf74551f2ad4453be637
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ev
lib/c-ares
lib/openssl
{% endblock %}

{% block configure_flags %}
--disable-python-bindings
{% endblock %}
