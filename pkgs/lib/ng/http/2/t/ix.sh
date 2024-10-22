{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.64.0.tar.gz
sha:b452dc69a1fcbc9375389b8b154175d8b7b125cdd713fc426774c2b79a1ebd77
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
