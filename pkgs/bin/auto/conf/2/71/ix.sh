{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
sha:f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4
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
