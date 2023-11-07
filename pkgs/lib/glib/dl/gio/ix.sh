{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/glib
{% endblock %}

{% block export_libs %}
libgio-2.0.a
{% endblock %}

{% block export_lib %}
gio-2
{% endblock %}
