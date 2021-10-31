{% extends '//shell/cli/bash/5.1.18/template/template.sh' %}

{% block bashdeps %}
# bld lib/readline/package.sh
# bld lib/curses/any/package.sh
# bld lib/iconv/package.sh
# bld lib/intl/package.sh
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
