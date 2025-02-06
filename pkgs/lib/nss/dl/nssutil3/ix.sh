{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/nss
{% endblock %}

{% block export_libs %}
libnssutil.a
{% endblock %}

{% block export_lib %}
nssutil3
{% endblock %}
