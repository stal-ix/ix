{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iotop
{% endblock %}

{% block version %}
1.33
{% endblock %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0aa859e481892cc5f8415549be16f599f68f0f8087c56692c16474bb49a7babe
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
