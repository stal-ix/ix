{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/sshfs/releases/download/sshfs-{{self.version().strip()}}/sshfs-{{self.version().strip()}}.tar.xz
893013ce6cdbf6f9fa790c9a4ca2b07eea95139f965f5c14f06b458cbe17f00d
{% endblock %}

{% block pkg_name %}
sshfs
{% endblock %}

{% block version %}
3.7.7
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/fuse/3
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
