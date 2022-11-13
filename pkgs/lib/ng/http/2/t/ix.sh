{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.51.0.tar.gz
sha:dfcf41e0b093765a79c9f1fc0ba6dc3d524555e94483ea9ba8b87a6d454971ba
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ev
lib/c/ares
lib/openssl
{% endblock %}

{% block configure_flags %}
--disable-python-bindings
{% endblock %}
