{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz
61fba141303aeaf8d9a6931d247f2f4a
{% endblock %}

{% block lib_deps %}
lib/curses/any/mix.sh
{% endblock %}

{% block bld_deps %}
lib/event/mix.sh
lib/utf8proc/mix.sh
dev/lang/byacc/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block configure %}
dash ./configure --prefix="${out}" --enable-utf8proc
{% endblock %}
