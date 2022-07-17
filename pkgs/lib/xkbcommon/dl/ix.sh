{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/xkbcommon
{% endblock %}

{% block export_libs %}
libxkbcommon.a
{% endblock %}

{% block export_lib %}
xkbcommon
{% endblock %}
