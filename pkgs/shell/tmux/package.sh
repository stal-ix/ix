{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz
# md5 61fba141303aeaf8d9a6931d247f2f4a
{% endblock %}

{% block deps %}
# lib lib/ncurses
# bld lib/event lib/utf8proc
# bld dev/build/make dev/lang/byacc dev/build/pkg-config env/std
{% endblock %}

{% block cflags %}
export COFLAGS=$(echo ${COFLAGS} | tr ' ' '\n' | grep -v 'static' | tr '\n' ' ')
{% endblock %}

{% block coflags %}
--enable-utf8proc
{% endblock %}
