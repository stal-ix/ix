{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/4.14.1.tar.gz
sha:883a616991ebb850beca0a61e00721cc58b22f1597b3b97dd083d11701b814d3
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
