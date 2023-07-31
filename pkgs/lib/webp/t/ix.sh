{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.3.1.tar.gz
sha:b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
