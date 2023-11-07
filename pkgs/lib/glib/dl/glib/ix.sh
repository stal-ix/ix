{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/glib
{% endblock %}

{% block export_libs %}
libglib-2.0.a
{% endblock %}

{% block export_lib %}
glib-2
{% endblock %}
