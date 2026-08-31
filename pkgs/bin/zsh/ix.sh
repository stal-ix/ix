{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
zsh
{% endblock %}

{% block version %}
5.9.2
{% endblock %}

{% block fetch %}
https://www.zsh.org/pub/zsh-{{self.version().strip()}}.tar.xz
36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/cap
lib/pam
{% endif %}
lib/curses
{% endblock %}

{% block configure_flags %}
--with-tcsetpgrp
{% endblock %}
