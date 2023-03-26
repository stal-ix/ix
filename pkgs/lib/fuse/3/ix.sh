{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-3.14.1.tar.gz
sha:99688d68a753ee97eed51d536b216b8ae5d7fe0236c1a45d439357903bfd4d88
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
