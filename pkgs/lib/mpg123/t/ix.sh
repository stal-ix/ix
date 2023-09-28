{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.32.2.tar.bz2
sha:ce77e9c20f4fa47c78f5cc7a7fcc97b9a2c36a03eb31fba8e0cf9933df79ea38
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
