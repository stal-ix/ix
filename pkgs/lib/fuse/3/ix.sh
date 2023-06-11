{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-3.15.0.tar.gz
sha:1e79f1dd60eaf79645c21411c4a7028c97b5e745ea677ac5bda747c90497a785
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
