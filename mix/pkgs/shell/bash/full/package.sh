{% extends '//shell/bash/template/template.sh' %}

{% block deps %}
# dep lib/readline lib/ncurses lib/iconv lib/intl
# dep dev/lang/byacc dev/build/make env/std
{% endblock %}

{% block conf %}
--with-installed-readline
--enable-readline
--with-curses
--enable-prompt-string-decoding
{% endblock %}
