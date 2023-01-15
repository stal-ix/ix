{% extends '//bin/mc/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/curses
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-screen=ncurses
{% endblock %}
