{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.60.0.tar.gz
sha:3cc9403c64e0a133868f62132ff0884cd5dc567eee5bd7b2d03ac81293695d6b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
