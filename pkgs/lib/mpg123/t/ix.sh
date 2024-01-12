{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.mpg123.org/download/mpg123-1.32.4.tar.bz2
sha:5a99664338fb2f751b662f40ee25804d0c9db6b575dcb5ce741c6dc64224a08a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
