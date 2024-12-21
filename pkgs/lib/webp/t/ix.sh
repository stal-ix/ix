{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.5.0.tar.gz
sha:7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
