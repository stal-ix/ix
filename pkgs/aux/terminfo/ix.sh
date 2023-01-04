{% extends '//lib/ncurses/t/ix.sh' %}

{% block env %}
export TERMINFO="${out}/share/terminfo"
export TERMINFO_DATA="${out}"
{% endblock %}
