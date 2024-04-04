{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.32.6.tar.bz2
sha:ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
