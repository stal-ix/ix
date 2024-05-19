{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.62.1.tar.gz
sha:73c8af772dd2b30cedc114d37291cf1485b0a7ce11833595fc2aec7b3ce3ba5c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
