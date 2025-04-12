{% extends '//die/c/meson.sh' %}

{% block version %}
3.17.1
{% endblock %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-{{self.version().strip()}}.tar.gz
sha:b81027fc8f444fb574de7f13edf0cf9810643d2935670c4fe19f140354241208
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
