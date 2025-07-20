{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libfuse
{% endblock %}

{% block version %}
3.17.3
{% endblock %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-{{self.version().strip()}}.tar.gz
99dcab8a4be0e5d3c44f882ab9d4a711533f8cb4a4298e41175ff9bb63770fe5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block meson_flags %}
utils=false
useroot=false
{% endblock %}

{% block patch %}
sed -e 's|__off64_t|off_t|' -i include/fuse_lowlevel.h
{% endblock %}
