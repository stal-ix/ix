{% extends '//shell/cli/bash/5.1.18/template/template.sh' %}

{% block bashdeps %}
# bld lib/readline/mix.sh
# bld lib/curses/any/mix.sh
# bld lib/iconv/mix.sh
# bld lib/intl/mix.sh
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
