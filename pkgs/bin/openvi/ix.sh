{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/7.1.17.tar.gz
sha:02974603f1cd3ba5727fd40f69f97925510d8f30c1ff3041adbc3e54e11f6d5f
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
