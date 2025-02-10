{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/nss
{% endblock %}

{% block export_libs %}
libnssckbi.a
{% endblock %}

{% block export_lib %}
nssckbi
{% endblock %}
