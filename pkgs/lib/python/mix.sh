{% extends '//mix/template/lib.sh' %}

{% block deps %}
lib/python/{{(python or '3.10').replace('.', '/')}}/mix.sh
{% endblock %}
