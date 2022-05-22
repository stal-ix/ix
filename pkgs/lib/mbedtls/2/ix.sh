{% extends '//lib/mbedtls/t/ix.sh' %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v2.27.0.tar.gz
f0ca42d59198e4f0695229f193b434c7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
