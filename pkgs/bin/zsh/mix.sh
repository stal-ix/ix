{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://www.zsh.org/pub/zsh-5.8.tar.xz
sha:dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/pam
lib/curses
{% endblock %}
