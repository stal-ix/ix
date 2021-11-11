{% extends '//mix/template/hub.sh' %}

{% block deps %}
lib/openssl/{{openssl or '3'}}/mix.sh
{% endblock %}
