{% extends 't/mix.sh' %}

{% block bld_libs %}
lib/c/mix.sh
lib/readline/mix.sh
lib/curses/mix.sh
lib/iconv/mix.sh
lib/intl/mix.sh
{{super()}}
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3/6/mix.sh
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
