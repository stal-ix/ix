{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dev.yorhel.nl/download/ncdu-1.20.tar.gz
sha:5fe2bb841abe72374bb242dbb93293c4ae053078432d896a7481b2ff10be9572
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block configure_flags %}
--with-shell=/bin/sh
{% endblock %}
