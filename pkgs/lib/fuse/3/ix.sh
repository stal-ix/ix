{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libfuse
{% endblock %}

{% block version %}
3.17.2
{% endblock %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-{{self.version().strip()}}.tar.gz
9d34adf5bd979cd62479340d9854e6a424a7ead7ee632e4a6da104ec0796f923
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
