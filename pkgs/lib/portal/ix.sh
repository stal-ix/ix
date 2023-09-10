{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/libportal/archive/refs/tags/0.7.1.tar.gz
sha:6ac8e0e2aa04f56d0320adff03e5f20a0c5d7d1a33d4b19e22707bfbece0b874
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/{{gtk_ver}}
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
{% endblock %}

{% block meson_flags %}
vapi=false
docs=false
tests=false
introspection=false
backend-gtk{{gtk_ver}}=enabled
{% endblock %}
