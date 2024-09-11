{% extends '//lib/curl/full/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/openssl
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}
