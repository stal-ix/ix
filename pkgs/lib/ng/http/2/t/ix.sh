{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nghttp2
{% endblock %}

{% block version %}
1.70.0
{% endblock %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d38d641fb3877b4847c774ad88b5f3ab70daf1ae0e616079bbeec4691186fc6a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
