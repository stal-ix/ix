{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/sshfs/releases/download/sshfs-{{self.version().strip()}}/sshfs-{{self.version().strip()}}.tar.xz
6a1bcb31450a077e9cb1b7ff158c71de34db697c3c0da6cb362502131e495893
{% endblock %}

{% block pkg_name %}
sshfs
{% endblock %}

{% block version %}
3.7.6
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
