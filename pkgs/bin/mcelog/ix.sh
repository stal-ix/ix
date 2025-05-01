{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mcelog
{% endblock %}

{% block version %}
206
{% endblock %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:2f0deb89b68118891d4e6b83594d997861506079f88b9641c6a92adc36e856a2
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
