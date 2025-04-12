{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
shadow
{% endblock %}

{% block version %}
4.17.4
{% endblock %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:4d81469d9c61452306095a9f36dd4645f8e18e96a2aff944489a6484fe0ad4e9
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
