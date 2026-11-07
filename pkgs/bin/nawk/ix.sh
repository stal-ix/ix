{% extends '//die/c/make.sh' %}

{% block pkg_name %}
awk
{% endblock %}

{% block version %}
20261106
{% endblock %}

{% block fetch %}
https://github.com/onetrueawk/awk/archive/refs/tags/{{self.version().strip()}}.tar.gz
1b354fe6fa0089a959ef912085e7a064236d15a7d3c9e6ce86456c3b87d3f464
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp a.out ${out}/bin/nawk
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
