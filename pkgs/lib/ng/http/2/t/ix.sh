{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nghttp2
{% endblock %}

{% block version %}
1.68.0
{% endblock %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
07dfdadf670193baa7d6c23a007afa6ff2d3e4301b2a701c41dfd053e3468f09
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
