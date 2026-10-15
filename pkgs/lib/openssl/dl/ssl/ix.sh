{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/openssl
{% endblock %}

{% block export_libs %}
libssl.a
{% endblock %}

{% block export_lib %}
ssl
{% endblock %}
