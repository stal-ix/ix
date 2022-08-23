{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.49.0.tar.gz
sha:744f38f8d6e400a424bf62df449c91e3ffacbae11b5fab99e44a480f5c735ab9
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ev
lib/c-ares
lib/openssl
{% endblock %}

{% block configure_flags %}
--disable-python-bindings
{% endblock %}
