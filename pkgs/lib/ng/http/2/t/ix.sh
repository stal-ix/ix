{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.63.0.tar.gz
sha:f3da0627bee7a6a60f5a4eb6de8d17d25e99f50f87b0fc0c20676c682bf31098
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
--disable-python-bindings
{% endblock %}
