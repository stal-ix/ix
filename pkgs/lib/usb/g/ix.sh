{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libgusb/archive/refs/tags/0.4.6.tar.gz
sha:0ad7e9f68b3e188149c583f411878db418d6f9600fd1b78e96fea11a8399ad0a
{% endblock %}

{% block lib_deps %}
lib/c
lib/usb
lib/glib
lib/json/glib
{% endblock %}

{% block meson_flags %}
docs=false
vapi=false
introspection=false
{% endblock %}
