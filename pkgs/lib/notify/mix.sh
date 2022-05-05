{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.7/libnotify-0.7.12.tar.xz
sha:744b2b37508135f8261b755a9debe6e09add421adc75bde930f6e198b70ab46e
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
