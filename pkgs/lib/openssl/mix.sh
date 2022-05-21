{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/openssl/{{openssl or '3'}}
{% endblock %}
