{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-3.13.0.tar.gz
sha:224544214204eb348b548d6faa7a9bc91b053aacfc92e8b5da3f478c76ae4a03
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
