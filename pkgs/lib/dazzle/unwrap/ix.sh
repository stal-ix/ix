{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdazzle
{% endblock %}

{% block version %}
3.44.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdazzle/-/archive/{{self.version().strip()}}/libdazzle-{{self.version().strip()}}.tar.bz2
845b068013fce8975b83571172b3718c3e61fd1c53b01e74abc66c52a62ed53a
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
with_introspection=false
enable_tests=false
with_vapi=false
{% endblock %}
