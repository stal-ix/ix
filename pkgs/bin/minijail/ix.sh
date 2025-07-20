{% extends '//die/c/make.sh' %}

{% block version %}
2025.07.02
{% endblock %}

{% block pkg_name %}
minijail
{% endblock %}

{% block fetch %}
https://github.com/google/minijail/archive/refs/tags/linux-v{{self.version().strip()}}.tar.gz
2fb5a44ea2ffcdeb2f7ce0d7471e0f5d3069595954267a012f5dd0a41ffd2e4c
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block patch %}
sed -e 's|/bin/echo|echo|' -i Makefile
sed -e 's|/bin/echo|echo|' -i common.mk
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp minijail0 ${out}/bin/
{% endblock %}
