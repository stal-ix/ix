{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/xkb/common
{% endblock %}

{% block export_libs %}
libxkbcommon.a
{% endblock %}

{% block export_lib %}
xkbcommon
{% endblock %}
