{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/c
lib/edit
lib/curses
{% endblock %}

{% block configure %}
sh configure --prefix="${out}" --with-term-lib=ncurses
{% endblock %}
