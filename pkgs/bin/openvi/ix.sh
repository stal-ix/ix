{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/7.1.18.tar.gz
sha:39c4ac933f52c65021be06fcece8bfd308fc1ac08e8ff4604b2fdd1994192d08
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

find . -type f | while read l; do
    sed -e "s|/tmp/vi.X|vi.X|g" -i ${l}
done
{% endblock %}
