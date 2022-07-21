{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
sha:e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f
{% endblock %}

{% block bld_libs %}
lib/c
lib/event
lib/curses
lib/utf8/proc
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block configure_flags %}
--enable-utf8proc
{% endblock %}

{% block enable_static %}
{% endblock %}
