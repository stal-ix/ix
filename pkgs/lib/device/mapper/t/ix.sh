{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.28
{% endblock %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.{{self.version().strip()}}.tgz
sha:b822baff6b62df36382c717ceba98a2688ebb31bf2b768f3ffa2b6d5e2557242
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/auto/archive
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
