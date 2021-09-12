{% extends '//shell/bash/5.1.18/template/template.sh' %}

{% block bashdeps %}
# bld lib/readline lib/ncurses lib/iconv lib/intl
{% endblock %}

{% block bashflags %}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}
