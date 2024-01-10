{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
bin/hypr/wlroots
{% endblock %}

{% block export_libs %}
libwlroots.a
{% endblock %}

{% block export_lib %}
wlroots
{% endblock %}
