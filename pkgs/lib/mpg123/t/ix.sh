{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/1.32.8/mpg123-1.32.8.tar.bz2
sha:feee1374c79540e0e405df0bc45fde20ad67011425c361a2759e2146894a27a7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
