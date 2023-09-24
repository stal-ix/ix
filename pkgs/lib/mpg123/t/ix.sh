{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.32.1.tar.bz2
sha:fceb97d3999cd3d04c7f96b97e621d01a5de0a46a3d9e9ceaa87768274ea205f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
