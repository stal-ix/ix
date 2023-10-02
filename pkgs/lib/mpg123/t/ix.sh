{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.32.3.tar.bz2
sha:2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
