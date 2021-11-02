{% extends '//shell/cli/bash/5.1.18/template/template.sh' %}

{% block bashdeps %}
lib/readline/mix.sh
lib/curses/any/mix.sh
lib/iconv/mix.sh
lib/intl/mix.sh
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
