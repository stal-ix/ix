{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/4.16.0.tar.gz
sha:347ad66883725a3d4db53d32d5a1645d0792b038894fbc234affc02af02285ff
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
