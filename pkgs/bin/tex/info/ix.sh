{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.1.tar.xz
sha:bcd221fdb2d807a8a09938a0f8d5e010ebd2b58fca16075483d6fcb78db2c6b2
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
