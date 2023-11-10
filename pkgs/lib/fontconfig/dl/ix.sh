{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/fontconfig
{% endblock %}

{% block export_libs %}
libfontconfig.a
{% endblock %}

{% block export_lib %}
fontconfig
{% endblock %}
