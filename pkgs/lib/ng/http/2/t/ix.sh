{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nghttp2
{% endblock %}

{% block version %}
1.66.0
{% endblock %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e2505d08aafac303ed8e3b94bf8caafa55ddcc198f89b254bb79a61a379498ea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
