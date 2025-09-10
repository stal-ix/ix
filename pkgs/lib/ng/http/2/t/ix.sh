{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nghttp2
{% endblock %}

{% block version %}
1.67.0
{% endblock %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e750161896a4b575f203ae378b199ddc9ec6ce6c06c7308d6a9b0290491cfca3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
