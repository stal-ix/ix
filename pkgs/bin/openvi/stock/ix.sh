{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/7.4.27.tar.gz
sha:7a40c9388c4f34d039a1fcac0ce24cc4ed6cb892d016fe26c0aaa6f42293ad47
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
