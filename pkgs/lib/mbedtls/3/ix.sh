{% extends '//lib/mbedtls/t/ix.sh' %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.0.0.tar.gz
md5:badb5372a698b7f3c593456a66260036
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
