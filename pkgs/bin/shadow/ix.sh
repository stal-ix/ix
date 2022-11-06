{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/4.12.3.tar.gz
sha:dce285623693c30b22341c029210cdb0c9cd6d39a5883e0110c380072d26f4e5
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/attr
lib/linux
lib/xcrypt
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
