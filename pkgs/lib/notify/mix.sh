{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.7/libnotify-0.7.11.tar.xz
sha:dd5682ec68220339e11c5159b7e012204a318dd1b3683a09c482ca421ab07375
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block meson_flags %}
introspection=disabled
man=false
gtk_doc=false
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}
