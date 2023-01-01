{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/7.2.20.tar.gz
sha:9bb7538f7381fd2d2bdc574f98bb154052b302200b1976203714086b007bf511
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bin/mawk
bld/perl
{% endblock %}

{% block make_flags %}
PAWK=mawk
CHOWN=echo
{% endblock %}

{% block patch %}
sed -e "s|/var/tmp|${TMPDIR}|g" -i GNUmakefile
{% endblock %}
