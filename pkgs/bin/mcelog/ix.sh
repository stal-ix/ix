{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/andikleen/mcelog/archive/refs/tags/v200.tar.gz
sha:0a0efa3c7704abaeff52f01e0da8d867c86886a1d033d9ec038e477e2d1e95e8
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
