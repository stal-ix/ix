{% extends '//mix/template/hub.sh' %}

{% block deps %}
lib/curses/{{curses or 'n'}}/mix.sh
{% endblock %}
