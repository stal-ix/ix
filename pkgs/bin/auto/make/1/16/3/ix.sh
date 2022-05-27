{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
c27f608a4e1f302ec7ce42f1251c184e
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
