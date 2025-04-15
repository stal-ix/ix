{% extends '//die/c/make.sh' %}

{% block version %}
18
{% endblock %}

{% block pkg_name %}
minijail
{% endblock %}

{% block fetch %}
https://github.com/google/minijail/archive/refs/tags/linux-v{{self.version().strip()}}.tar.gz
sha:006ca2c78d11e12dd3d32705f97cda8c597ba38b32b09bfa10654b4dec6d1664
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
