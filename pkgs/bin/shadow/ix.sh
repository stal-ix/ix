{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/4.17.2.tar.gz
sha:b084708c1d703bd127cc8254873a3d0f966c712c82f2a954a88d44727fdffa0c
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
