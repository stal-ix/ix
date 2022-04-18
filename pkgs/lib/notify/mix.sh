{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.7/libnotify-0.7.9.tar.xz
sha:66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761
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
