{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.112.tar.gz
sha:7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a
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

{% block setup %}
export GLIB_GENMARSHAL=$(which glib-genmarshal)
{% endblock %}

{% block patch %}
>dbus/examples/Makefile.am
{% endblock %}
