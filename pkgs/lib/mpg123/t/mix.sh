{% extends '//die/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/1.29.3/mpg123-1.29.3.tar.bz2
sha:963885d8cc77262f28b77187c7d189e32195e64244de2530b798ddf32183e847
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
