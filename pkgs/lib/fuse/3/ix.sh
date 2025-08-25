{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libfuse
{% endblock %}

{% block version %}
3.17.4
{% endblock %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-{{self.version().strip()}}.tar.gz
dd21d1545c05e73ada594b93fe593351b7dbf10940fd93b934b9395513108b34
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
