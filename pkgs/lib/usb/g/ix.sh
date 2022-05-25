{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libgusb/archive/refs/tags/0.3.10.tar.gz
sha:e699b06f4809f9d166b13dc9f5812b0dd026591d3cae90ec5483aa2687f3b80b
{% endblock %}

{% block lib_deps %}
lib/c
lib/usb
lib/glib
{% endblock %}

{% block meson_flags %}
docs=false
vapi=false
introspection=false
{% endblock %}
