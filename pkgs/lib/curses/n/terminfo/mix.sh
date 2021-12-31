{% extends '//lib/curses/n/t/mix.sh' %}

{% block env %}
export TERMINFO="${out}/share/terminfo"
export TERMINFO_DATA="${out}"
{% endblock %}
