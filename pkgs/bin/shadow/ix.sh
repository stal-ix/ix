{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/4.14.5.tar.gz
sha:5af9793d0a1cfcdc3bac3ac7548914ee13c2e83f88433a94ca0131384604cfed
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
