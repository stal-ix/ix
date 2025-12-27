{% extends '//die/c/make.sh' %}

{% block pkg_name %}
keyd
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block fetch %}
https://github.com/rvaiya/keyd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
697089681915b89d9e98caf93d870dbd4abce768af8a647d54650a6a90744e26
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
