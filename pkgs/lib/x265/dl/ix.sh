{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/x265
{% endblock %}

{% block export_libs %}
libx265.a
{% endblock %}

{% block export_lib %}
x265
{% endblock %}
