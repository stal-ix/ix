{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v198.tar.gz
sha:131e97593016cb899abc94a7ff88ffdd2e34c363f311a3ff07518f9ffb27e4b8
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
