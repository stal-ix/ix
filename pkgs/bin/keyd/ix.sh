{% extends '//die/c/make.sh' %}

{% block pkg_name %}
keyd
{% endblock %}

{% block version %}
2.5.0
{% endblock %}

{% block fetch %}
https://github.com/rvaiya/keyd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:93ec6c153ef673a7a8b4d8b686494dee11d182513f4531c71dce15a8db7f6c1c
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/input
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block make_flags %}
CONFIG_DIR=${out}/etc/keyd
{% endblock %}

{% block patch %}
sed -e 's|.*mkdir.*/etc/keyd||' -i Makefile
{% endblock %}

{% block install %}
mkdir -p ${out}/etc/keyd
{{super()}}
{% endblock %}
