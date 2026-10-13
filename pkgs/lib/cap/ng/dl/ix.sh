{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/cap/ng
{% endblock %}

{% block export_libs %}
libcap-ng.a
{% endblock %}

{% block export_lib %}
cap-ng
{% endblock %}
