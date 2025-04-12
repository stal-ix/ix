{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.65.0
{% endblock %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:bcf08112bd583f8543776d086dcdede159b87e1261a36e6ae1d931c812a3ca70
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
