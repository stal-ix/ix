{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bcache-tools
{% endblock %}

{% block version %}
1.1
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/colyli/bcache-tools.git/snapshot/bcache-tools-{{self.version().strip()}}.tar.gz
d1c92274ae03b414dd1a05277bf89dd2a8395496c692e3b143d9e6112d3421f8
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux/util
{% endblock %}

{% block make_flags %}
PREFIX=/
DESTDIR=${out}/
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block install %}
mkdir -p ${out}/sbin ${out}/lib/udev/rules.d ${out}/share/man/man8
{{super()}}
mv ${out}/sbin ${out}/bin
mv ${out}/usr/share/* ${out}/share/
rm -rf ${out}/usr
{% endblock %}
