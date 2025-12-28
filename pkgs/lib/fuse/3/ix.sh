{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libfuse
{% endblock %}

{% block version %}
3.18.1
{% endblock %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-{{self.version().strip()}}.tar.gz
adb6b7eed09331d72cbbe6d5ef3597024ab46a1d61c6ca7cdd495e51600f8957
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
