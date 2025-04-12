{% extends '//die/c/make.sh' %}

{% block version %}
7.6.30
{% endblock %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1ac5487280deca5fe539d5b6302bfbc95a9eb52aa2e3807d30f5dd82f0bdb355
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
