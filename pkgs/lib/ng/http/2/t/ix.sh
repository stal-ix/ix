{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.62.0.tar.gz
sha:c69e357d9464eedd8bb6e425cf81365e03f884d0b6433ca248e66ae124d96ada
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
