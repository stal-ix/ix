{% extends '//die/c/meson.sh' %}

{% block version %}
0.4.9
{% endblock %}

{% block fetch %}
https://github.com/hughsie/libgusb/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:aa1242a308183d4ca6c2e8c9e3f2e345370b94308ef2d4b6e9c10d5ff6d7763e
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
