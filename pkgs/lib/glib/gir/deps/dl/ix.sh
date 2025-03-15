{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/glib/gir/deps
{% endblock %}

{% block export_libs %}
libgirepository-2.0.a
{% endblock %}

{% block export_lib %}
girepository-2.0
{% endblock %}
