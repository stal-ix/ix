{% extends '//die/c/make.sh' %}

{% block pkg_name %}
awk
{% endblock %}

{% block version %}
20250116
{% endblock %}

{% block fetch %}
https://github.com/onetrueawk/awk/archive/refs/tags/{{self.version().strip()}}.tar.gz
e031b1e1d2b230f276f975bffb923f0ea15f798c839d15a3f26a1a39448e32d7
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
