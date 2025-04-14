{% extends '//die/c/make.sh' %}

{% block pkg_name %}
star
{% endblock %}

{% block version %}
1.6
{% endblock %}

{% block fetch %}
https://sourceforge.net/projects/s-tar/files/star-{{self.version().strip()}}.tar.bz2
sha:1b18662ebae6c3509020953d4464e654c7ded4752774de987d8dc307dc43f776
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
INS_BASE=${out}
LINKMODE=static
GMAKE_NOWARN=true
INSUSR=root
INSGRP=root
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e "s|/tmp/|${TMPDIR}/|" -i ${l}
done
{% endblock %}

{% block c_rename_symbol %}
strtod
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -rf sbin
{% endblock %}
