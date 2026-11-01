{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/freetype
{% endblock %}

{% block export_libs %}
libfreetype.a
{% endblock %}

{% block export_lib %}
freetype
{% endblock %}
