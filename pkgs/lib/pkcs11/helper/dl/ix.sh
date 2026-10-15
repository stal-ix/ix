{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/pkcs11/helper
{% endblock %}

{% block export_libs %}
libpkcs11-helper.a
{% endblock %}

{% block export_lib %}
pkcs11-helper
{% endblock %}
