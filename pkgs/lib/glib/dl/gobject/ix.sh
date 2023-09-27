{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/glib
{% endblock %}

{% block export_libs %}
libgobject-2.0.a
{% endblock %}

{% block export_lib %}
gobject-2.0
{% endblock %}
