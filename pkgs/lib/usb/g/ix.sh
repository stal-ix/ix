{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libgusb/archive/refs/tags/0.4.7.tar.gz
sha:3c0f4a01144810ea1ea0c1a8ff7b84098fced7939d002c54a143145a6fbd94d8
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
