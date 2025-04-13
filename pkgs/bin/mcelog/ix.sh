{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mcelog
{% endblock %}

{% block version %}
204
{% endblock %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:a3eda1313dead81e68c99b622041a6914be85e3c4510bdb5a776b578dbdd98ea
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
