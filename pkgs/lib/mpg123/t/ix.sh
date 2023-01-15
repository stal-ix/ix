{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.31.2.tar.bz2
sha:b17f22905e31f43b6b401dfdf6a71ed11bb7d056f68db449d70b9f9ae839c7de
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
