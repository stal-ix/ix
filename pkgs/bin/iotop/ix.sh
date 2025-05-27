{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iotop
{% endblock %}

{% block version %}
1.30
{% endblock %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:862e3d3d0263e4171aa9c5aaed2dd7d76ca746afa58ecbb6eca002717e9fa240
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
