{% extends '//mix/template/hub.sh' %}

{% block deps %}
lib/curses/{{mix.flags.get('curses', 'n')}}/mix.sh
{% endblock %}
