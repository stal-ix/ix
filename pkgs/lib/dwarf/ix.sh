{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.11.1.tar.xz
sha:b5be211b1bd0c1ee41b871b543c73cbff5822f76994f6b160fc70d01d1b5a1bf
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
