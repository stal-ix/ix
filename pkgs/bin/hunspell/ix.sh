{% extends '//lib/hunspell/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/curses
lib/readline
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-ui
--with-readline
{% endblock %}
