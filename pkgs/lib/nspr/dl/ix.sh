{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/nspr
{% endblock %}

{% block export_libs %}
libnspr4.a
{% endblock %}

{% block export_lib %}
nspr4
{% endblock %}
