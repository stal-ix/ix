{% extends '//die/c/make.sh' %}

{% block pkg_name %}
OpenVi
{% endblock %}

{% block version %}
8.0.34
{% endblock %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/{{self.version().strip()}}.tar.gz
27cab6f631f1d8aefc33c944a3f226ebb8d5ad4325f50b6f52d60be7b823ded8
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
