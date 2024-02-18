{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.32.5.tar.bz2
sha:af908cdf6cdb6544b97bc706a799f79894e69468af5881bf454a0ebb9171ed63
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
