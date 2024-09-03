{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/libportal/archive/refs/tags/0.8.0.tar.gz
sha:ff98d6376980a698273023eda1a93487014d51aaac6a54c6516a6954f2b14188
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
