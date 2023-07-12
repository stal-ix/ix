{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.55.0.tar.gz
sha:6d2a4d246e84cb1e3e581591bd1c50ecc085e50090bc068ed5a67f87c6b4a06e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
