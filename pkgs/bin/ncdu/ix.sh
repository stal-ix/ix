{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ncdu
{% endblock %}

{% block version %}
1.20
{% endblock %}

{% block fetch %}
https://dev.yorhel.nl/download/ncdu-{{self.version().strip()}}.tar.gz
5fe2bb841abe72374bb242dbb93293c4ae053078432d896a7481b2ff10be9572
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block configure_flags %}
--with-shell=/bin/sh
{% endblock %}
