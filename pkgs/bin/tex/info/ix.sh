{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.1.tar.xz
sha:31ae37e46283529432b61bee1ce01ed0090d599e606fc6a29dca1f77c76a6c82
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cpp_includes %}
${PWD}/gnulib/lib
{% endblock %}
