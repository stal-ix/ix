{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/1.32.7/mpg123-1.32.7.tar.bz2
sha:3c8919243707951cac0e3c39bbf28653bcaffc43c98ff16801a27350db8f0f21
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
