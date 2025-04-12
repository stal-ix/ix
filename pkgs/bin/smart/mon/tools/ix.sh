{% extends '//die/c/autorehell.sh' %}

{% block version %}
7.4
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/sourceforge/smartmontools/smartmontools-{{self.version().strip()}}.tar.gz
sha:e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/cap/ng
{% endblock %}

{% block configure_flags %}
--with-libcap-ng=yes
{% endblock %}
