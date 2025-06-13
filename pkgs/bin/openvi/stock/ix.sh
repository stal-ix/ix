{% extends '//die/c/make.sh' %}

{% block pkg_name %}
OpenVi
{% endblock %}

{% block version %}
7.6.31
{% endblock %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/{{self.version().strip()}}.tar.gz
75ef62fd882d8a18e388509f5fe4eca6b241f3286f6121e2bcbea65ec592ae11
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
