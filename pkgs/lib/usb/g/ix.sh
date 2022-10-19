{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libgusb/archive/refs/tags/0.4.2.tar.gz
sha:01a99aec431cc5e80979f8aad11e0e8f1aac3fd8504d3c2f2f2c0956bc35837b
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
