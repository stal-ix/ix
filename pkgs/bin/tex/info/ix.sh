{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.tar.xz
sha:deeec9f19f159e046fdf8ad22231981806dac332cc372f1c763504ad82b30953
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
