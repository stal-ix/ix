{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dbus-glib
{% endblock %}

{% block version %}
0.116
{% endblock %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-{{self.version().strip()}}.tar.gz
e3f3d4487e2883800770ed5899ed111bdc4ba7056af34a255c4c46ad8a2486f3
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/dbus
{% endblock %}

{% block bld_tool %}
bld/python
bld/glib
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup_target_flags %}
export GLIB_GENMARSHAL=$(which glib-genmarshal)
{% endblock %}

{% block patch %}
>dbus/examples/Makefile.am
{% endblock %}
