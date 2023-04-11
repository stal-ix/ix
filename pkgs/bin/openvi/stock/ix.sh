{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/7.3.22.tar.gz
sha:9599fde001d9df93c4f463e6ccbd66e28ad0d992db4f306ff987053fcfecb005
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
