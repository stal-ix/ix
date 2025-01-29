{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/20250126.tar.gz
sha:e678e4ac4e5913a65290e5b475467be831ab80e21dfe1b10a3d3f6ccf1c3d49b
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
