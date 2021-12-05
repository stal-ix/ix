{% extends '//lib/curses/n/mix.sh' %}

{% block env %}
export TERMINFO="${out}/share/terminfo"
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib
rm -rf ${out}/bin
rm -rf ${out}/include
{% endblock %}
