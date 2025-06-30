{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
shadow
{% endblock %}

{% block version %}
4.18.0
{% endblock %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/{{self.version().strip()}}.tar.gz
3f431df0caa13cd351edfa851d127afa4146f6a31129915ef9b79d40eccd4aea
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
