{% extends '//mix/template/lib.sh' %}

{% block deps %}
lib/openssl/{{openssl or '3'}}/mix.sh
{% endblock %}
