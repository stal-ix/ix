{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
automake
{% endblock %}

{% block version %}
1.16.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
ff2bf7656c4d1c6fdda3b8bebb21f09153a736bcba169aaf65eab25fa113bf3a
{% endblock %}

{% block bld_tool %}
bld/m4
bld/perl
bld/auto/conf
{% endblock %}

{% block install %}
{{super()}}
find ${out}/bin -type f | while read l; do
    sed -e 's|/.*/store/.*/bin/sh|sh|g' -i ${l}
done
{% endblock %}
