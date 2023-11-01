{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/4.14.2.tar.gz
sha:ad7e266120013930129de67de6cd41a6e4fd53a406ccf55cdc4106eead0ae7a2
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/attr
lib/kernel
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/bison
bld/gettext
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin/* ${out}/bin/
rm -r ${out}/sbin
{% endblock %}
