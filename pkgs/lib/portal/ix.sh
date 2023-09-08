{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/libportal/releases/download/0.7/libportal-0.7.tar.xz
sha:64635f03c9501b829d3b4fd2246e8d840f92e2ed14053e082ed3dddda7d725fb
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
