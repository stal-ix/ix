{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mcelog
{% endblock %}

{% block version %}
212
{% endblock %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c98ede2d06f02c12d272dbb69da63d1f7160751d551664e190a8bb6a9138a206
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
bld/python
bld/shebangs
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}

{% block make_flags %}
etcprefix=${out}
{% endblock %}

{% block patch %}
fix_shebangs mkcputype
{% endblock %}
