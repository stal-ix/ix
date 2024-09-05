{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/libportal/archive/refs/tags/0.8.1.tar.gz
sha:279cd848c41655964ea5109fd50ddf01ba414601d5265d1d16b8409ff54217f8
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
docs=false
tests=false
backend-gtk{{gtk_ver}}=enabled
{% endblock %}
