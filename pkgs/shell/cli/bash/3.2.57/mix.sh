{% extends '//shell/cli/bash/template/template.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bash/bash-3.2.57.tar.gz
# md5 237a8767c990b43ae2c89895c2dbc062
{% endblock %}

{% block bashdeps %}
# bld lib/readline/mix.sh
# bld lib/curses/any/mix.sh
# bld lib/intl/mix.sh
# bld lib/iconv/mix.sh
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
