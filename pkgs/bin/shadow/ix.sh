{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
shadow
{% endblock %}

{% block version %}
4.20.3
{% endblock %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/{{self.version().strip()}}.tar.gz
17cf141ef01c7f75d0bb42e20d10d7d84dffae538328e067a62575cca4e543af
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

{% block configure_flags %}
--disable-logind
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin/* ${out}/bin/
rm -r ${out}/sbin
{% endblock %}
