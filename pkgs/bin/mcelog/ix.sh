{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mcelog
{% endblock %}

{% block version %}
213
{% endblock %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d93a14eb2abb26c740ec630c00e0e774fad67df4a07229399c6f977afd1ccd6a
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
