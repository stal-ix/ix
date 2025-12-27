{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mcelog
{% endblock %}

{% block version %}
208
{% endblock %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
476a52fa93ba9e733e670b8398279fca7caa2d58738c9f65198acce5dfbf8dfa
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
