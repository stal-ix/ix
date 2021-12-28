{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gobject-introspection/1.70/gobject-introspection-1.70.0.tar.xz
940ea2d6b92efabc457b9c54ce2ff398
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}
