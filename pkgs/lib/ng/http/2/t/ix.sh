{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.53.0.tar.gz
sha:40fc7edc8c5fed251fc4d3fa172e392913663b03630afce487d13daa351e077e
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
