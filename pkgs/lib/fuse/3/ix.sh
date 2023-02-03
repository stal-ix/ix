{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-3.13.1.tar.gz
sha:96399b09b91bc717a9e96ffea660d611e6a342547c1abd4d0e858b3dca9d5a13
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
