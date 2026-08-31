{% extends '//die/c/make.sh' %}

{% block pkg_name %}
OpenVi
{% endblock %}

{% block version %}
7.9.33
{% endblock %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/{{self.version().strip()}}.tar.gz
3b807837b8458609b37e107fa063160298ee3655998dd8df590885c297af1fd3
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/perl
bin/mawk/lite
{% endblock %}

{% block make_flags %}
PAWK=mawk
CHOWN=echo
{% endblock %}

{% block patch %}
sed -e "s|/var/tmp|${TMPDIR}|g" -i GNUmakefile
{% endblock %}
