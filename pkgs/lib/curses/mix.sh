{% extends '//mix/template/lib.sh' %}

{% block deps %}
lib/curses/{{curses or 'n'}}/mix.sh
{% endblock %}
