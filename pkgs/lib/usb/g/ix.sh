{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libgusb/archive/refs/tags/0.4.5.tar.gz
sha:74e492fc3eda2caf7ed0a0e472c83e49e3c9c063f9729e965b79addcbd387c64
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
