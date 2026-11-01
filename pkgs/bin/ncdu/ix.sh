{% extends '//die/c/autorehell.sh' %}

# noauto: ncdu 2.x is written in Zig; this is the last C line

{% block pkg_name %}
ncdu
{% endblock %}

{% block version %}
1.22
{% endblock %}

{% block fetch %}
https://dev.yorhel.nl/download/ncdu-{{self.version().strip()}}.tar.gz
0ad6c096dc04d5120581104760c01b8f4e97d4191d6c9ef79654fa3c691a176b
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block configure_flags %}
--with-shell=/bin/sh
{% endblock %}
