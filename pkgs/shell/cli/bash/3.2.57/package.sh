{% extends '//shell/cli/bash/template/template.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bash/bash-3.2.57.tar.gz
# md5 237a8767c990b43ae2c89895c2dbc062
{% endblock %}

{% block bashdeps %}
# bld lib/readline/package.sh
# bld lib/curses/any/package.sh
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
