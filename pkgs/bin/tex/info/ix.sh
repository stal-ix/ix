{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
texinfo
{% endblock %}

{% block version %}
7.1.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-{{self.version().strip()}}.tar.xz
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
