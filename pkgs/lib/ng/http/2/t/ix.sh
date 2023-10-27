{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.58.0.tar.gz
sha:7da19947b33a07ddcf97b9791331bfee8a8545e6b394275a9971f43cae9d636b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
