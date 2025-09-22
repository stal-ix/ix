{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nghttp2
{% endblock %}

{% block version %}
1.67.1
{% endblock %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3ab1d73bc1d7f080dc8487fbb2a4e8b29f7ae33aacbf75a2d2d22d4f994ca026
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
