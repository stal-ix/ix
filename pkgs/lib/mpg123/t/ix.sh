{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/1.30.1/mpg123-1.30.1.tar.bz2
sha:1b20c9c751bea9be556749bd7f97cf580f52ed11f2540756e9af26ae036e4c59
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
