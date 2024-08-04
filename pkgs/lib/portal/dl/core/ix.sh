{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/portal
{% endblock %}

{% block export_libs %}
libportal.a
{% endblock %}

{% block export_lib %}
portal
{% endblock %}
