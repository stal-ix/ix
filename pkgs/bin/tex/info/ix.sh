{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
texinfo
{% endblock %}

{% block version %}
7.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/texinfo/texinfo-{{self.version().strip()}}.tar.xz
0329d7788fbef113fa82cb80889ca197a344ce0df7646fe000974c5d714363a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
