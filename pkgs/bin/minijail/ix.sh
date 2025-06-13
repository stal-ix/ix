{% extends '//die/c/make.sh' %}

{% block version %}
2024.05.22
{% endblock %}

{% block pkg_name %}
minijail
{% endblock %}

{% block fetch %}
https://github.com/google/minijail/archive/refs/tags/linux-v{{self.version().strip()}}.tar.gz
3136365ca3762da3e725f734fbdc544d8c82d6a763f803b2850ed3c993c216f0
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
