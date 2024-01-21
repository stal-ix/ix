{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.59.0.tar.gz
sha:0dd5c980f1262ff5f03676fd99f46f250b66c842f7d864fa1ca9f8453e5f8868
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
