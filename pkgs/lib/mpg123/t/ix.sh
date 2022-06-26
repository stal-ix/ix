{% extends '//die/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/1.30.0/mpg123-1.30.0.tar.bz2
sha:397ead52f0299475f2cefd38c3835977193fd9b1db6593680346c4e9109ed61c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
