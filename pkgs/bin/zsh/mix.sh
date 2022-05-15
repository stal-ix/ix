{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.zsh.org/pub/zsh-5.9.tar.xz
sha:9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/pam
lib/curses
{% endblock %}

{% block configure_flags %}
--with-tcsetpgrp
{% endblock %}
