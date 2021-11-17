{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/openssl/{{openssl or '3'}}/mix.sh
{% endblock %}
