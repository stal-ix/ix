{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.54.0.tar.gz
sha:aae8bda9e06d7c51a12488175086edc44a46c230561dc7c45d779e00e43d4b8e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ev
lib/c/ares
lib/openssl
{% endblock %}

{% block configure_flags %}
--disable-python-bindings
{% endblock %}
