{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.52.0.tar.gz
sha:6b71561a9950b4a90fa36aa3160763f1437f3730d7a12434e416aa3f4ab145e0
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
