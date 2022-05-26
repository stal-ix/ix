{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
12cfa1687ffa2606337efe1a64416106
{% endblock %}

{% block bld_tool %}
bld/m4
bld/perl
{% endblock %}

{% block install %}
{{super()}}
find ${out}/bin -type f | while read l; do
    sed -e 's|/.*/store/.*/bin/sh|sh|' -i ${l}
done
{% endblock %}
