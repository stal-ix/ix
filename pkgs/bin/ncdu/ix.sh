{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dev.yorhel.nl/download/ncdu-1.18.1.tar.gz
sha:7c0fa1eb29d85aaed4ba174164bdbb8f011b5c390d017c57d668fc7231332405
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block configure_flags %}
--with-shell=/bin/sh
{% endblock %}
