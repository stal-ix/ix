{% extends '//lib/mbedtls/t/ix.sh' %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.2.1.tar.gz
sha:d0e77a020f69ad558efc660d3106481b75bd3056d6301c31564e04a0faae88cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
