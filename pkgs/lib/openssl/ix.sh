{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/openssl/{{libopenssl_ver or '3'}}
{% endblock %}
