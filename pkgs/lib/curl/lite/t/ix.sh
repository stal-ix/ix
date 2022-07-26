{% extends '//lib/curl/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}
