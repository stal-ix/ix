{% extends '//mix/template/hub.sh' %}

{% block deps %}
lib/openssl/{{mix.flags.get('openssl', '3')}}/mix.sh
{% endblock %}
