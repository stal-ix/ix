{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/z
{% endblock %}

{% block export_libs %}
libz.a
{% endblock %}

{% block export_lib %}
z
{% endblock %}
