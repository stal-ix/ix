{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/1.32.9/mpg123-1.32.9.tar.bz2
sha:03b61e4004e960bacf2acdada03ed94d376e6aab27a601447bd4908d8407b291
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
