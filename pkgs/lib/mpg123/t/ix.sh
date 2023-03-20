{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.31.3.tar.bz2
sha:1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
