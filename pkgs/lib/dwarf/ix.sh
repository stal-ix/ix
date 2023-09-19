{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.8.0.tar.xz
sha:771814a66b5aadacd8381b22d8a03b9e197bd35c202d27e19fb990e9b6d27b17
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
