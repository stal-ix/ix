{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/openssl
{% endblock %}

{% block export_libs %}
libcrypto.a
{% endblock %}

{% block export_lib %}
crypto
{% endblock %}
