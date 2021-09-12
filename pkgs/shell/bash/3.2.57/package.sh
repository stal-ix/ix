{% extends '//shell/bash/template/template.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bash/bash-3.2.57.tar.gz
# md5 237a8767c990b43ae2c89895c2dbc062
{% endblock %}

{% block bashdeps %}
# bld lib/readline lib/ncurses lib/intl lib/iconv
{% endblock %}
