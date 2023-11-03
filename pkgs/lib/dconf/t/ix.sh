{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/dconf/0.40/dconf-0.40.0.tar.xz
sha:cf7f22a4c9200421d8d3325c5c1b8b93a36843650c9f95d6451e20f0bcb24533
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/dbus
{% endblock %}

{% block meson_flags %}
man=false
gtk_doc=false
vapi=false
systemduserunitdir=${out}/tmp
bash_completion=false
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

