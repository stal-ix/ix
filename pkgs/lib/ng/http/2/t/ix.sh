{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.56.0.tar.gz
sha:63dd705b524eec3c843b8e4e24914600a30c2804a113e8e5baeeb9695d09590a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
