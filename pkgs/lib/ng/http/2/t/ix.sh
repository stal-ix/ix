{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.50.0.tar.gz
sha:6de469efc8e9d47059327a6736aebe0a7d73f57e5e37ab4c4f838fb1eebd7889
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
