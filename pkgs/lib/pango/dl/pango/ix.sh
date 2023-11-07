{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/pango
{% endblock %}

{% block export_libs %}
libpango-1.0.a
{% endblock %}

{% block export_lib %}
pango-1
{% endblock %}
