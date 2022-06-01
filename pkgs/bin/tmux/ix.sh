{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/tmux/tmux/releases/download/3.3/tmux-3.3.tar.gz
sha:b2382ac391f6a1c5b93293016cdc9488337d9a04b9d611ae05eac164740351dc
{% endblock %}

{% block bld_libs %}
lib/c
lib/event
lib/curses
lib/utf8proc
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block configure_flags %}
--enable-utf8proc
{% endblock %}

{% block enable_static %}
{% endblock %}
