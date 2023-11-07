{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/pango
{% endblock %}

{% block export_libs %}
libpangoft2-1.0.a
{% endblock %}

{% block export_lib %}
pangoft2-1
{% endblock %}
