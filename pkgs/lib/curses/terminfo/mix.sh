{% extends '//lib/curses/n/mix.sh' %}

{% block env %}
export TERMINFO="${out}/share/terminfo"
{% endblock %}

{% block postinstall %}
cd ${out} && rm -rf lib bin include
{% endblock %}
