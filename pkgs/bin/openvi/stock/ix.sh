{% extends '//die/c/make.sh' %}

{% block pkg_name %}
OpenVi
{% endblock %}

{% block version %}
7.7.32
{% endblock %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/{{self.version().strip()}}.tar.gz
3378f371b7446708b5d909dcbf8608a74d771f2660f06014888da2163a77af81
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
