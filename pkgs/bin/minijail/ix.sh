{% extends '//die/c/make.sh' %}

{% block version %}
2026.05.18
{% endblock %}

{% block pkg_name %}
minijail
{% endblock %}

{% block fetch %}
https://github.com/google/minijail/archive/refs/tags/linux-v{{self.version().strip()}}.tar.gz
d6276177133059380227cc4fb6c18c796483f0c3ed5c9d458e4ac1231342373a
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
