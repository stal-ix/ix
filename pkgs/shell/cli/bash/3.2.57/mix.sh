{% extends '//shell/cli/bash/template/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-3.2.57.tar.gz
237a8767c990b43ae2c89895c2dbc062
{% endblock %}

{% block bashdeps %}
lib/readline/mix.sh
lib/curses/mix.sh
lib/intl/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
