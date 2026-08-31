{% extends '//die/c/make.sh' %}

{% block pkg_name %}
awk
{% endblock %}

{% block version %}
20260426
{% endblock %}

{% block fetch %}
https://github.com/onetrueawk/awk/archive/refs/tags/{{self.version().strip()}}.tar.gz
7ae5b9fc6a8149bc45ea0ba3ba434a69a16d1460d19f6d01b6f04cc885b8e02b
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
