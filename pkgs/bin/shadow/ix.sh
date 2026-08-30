{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
shadow
{% endblock %}

{% block version %}
4.20.2
{% endblock %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/{{self.version().strip()}}.tar.gz
61a7c9052a3b0ddc3d449e4e833c9ef90069ee944adab223080443adc1a91637
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
