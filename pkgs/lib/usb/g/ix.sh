{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libgusb/archive/refs/tags/0.4.8.tar.gz
sha:9a1fb0d46e4b1ca7ee777ed8177b344e50a849594cd98b51a38a512bef4b3342
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
