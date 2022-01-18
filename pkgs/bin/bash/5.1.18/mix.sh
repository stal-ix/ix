{% extends 't/mix.sh' %}

{% block bld_libs %}
lib/c
lib/readline
lib/curses
lib/iconv
lib/intl
{{super()}}
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3/6
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
