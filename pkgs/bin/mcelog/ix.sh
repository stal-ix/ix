{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v201.tar.gz
sha:635a2bdce0801fc67f4c5df901daec6d3843226801615d809e56d9f3759ccbe9
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}

{% block make_flags %}
etcprefix=${out}
{% endblock %}
