{% extends '//lib/mbedtls/t/ix.sh' %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v2.28.2.tar.gz
sha:bc55232bf71fd66045122ba9050a29ea7cb2e8f99b064a9e6334a82f715881a0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
