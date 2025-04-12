{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsecret
{% endblock %}

{% block version %}
0.21.7
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/{{self.version().strip()}}/libsecret-{{self.version().strip()}}.tar.bz2
sha:e799f25cba4802874dc59a8d6ea69331bf10fde913b10e7fe7ab01de3853f3dc
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
manpage=false
gtk_doc=false
debugging=false
introspection=false
{% endblock %}
