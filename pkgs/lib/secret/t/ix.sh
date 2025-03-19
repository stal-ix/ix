{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/0.21.7/libsecret-0.21.7.tar.bz2
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
