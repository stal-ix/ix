{% extends '//die/c/make.sh' %}

{% block pkg_name %}
awk
{% endblock %}

{% block version %}
20251225
{% endblock %}

{% block fetch %}
https://github.com/onetrueawk/awk/archive/refs/tags/{{self.version().strip()}}.tar.gz
626d7d19f8e4ceae70f60e2e662291789e0f54ab86945317a3d5693c30f847a2
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
