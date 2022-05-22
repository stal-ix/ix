{% extends '//die/autorehell.sh' %}

{# TODO(pg): X, gtk-doc #}

{% block fetch %}
https://github.com/lxde/libfm/archive/refs/tags/1.3.2.tar.gz
sha:e65aa86650879fcd6c06983164b95409b92724482191f06472c567cbd8cf5ddd
{% endblock %}

{% block lib_deps %}
lib/c
lib/dbus
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/gettext
bin/gtk/doc
bin/intltool
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
{% endblock %}
