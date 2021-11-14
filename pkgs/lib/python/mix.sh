{% extends '//mix/template/hub.sh' %}

{% block deps %}
lib/python/{{(python or '3.10').replace('.', '/')}}/mix.sh
{% endblock %}
