{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/dbus
{% endblock %}

{% block export_libs %}
libdbus-1.a
{% endblock %}

{% block export_lib %}
dbus-1
{% endblock %}
