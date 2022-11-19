{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/4.13.tar.gz
sha:94ddb93553a63af080db5b9dfe88ee6122d5db8b5d70b09bb03ed50f39ba829d
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/attr
lib/kernel
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
