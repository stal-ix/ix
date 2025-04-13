{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.114
{% endblock %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-{{self.version().strip()}}.tar.gz
sha:c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814d61b5e8fc2827a7c
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
