{% extends '//shell/cli/bash/5.1.18/template/template.sh' %}

{% block bashdeps %}
# bld lib/readline lib/curses/any lib/iconv lib/intl
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
