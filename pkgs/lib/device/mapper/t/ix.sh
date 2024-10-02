{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.2.03.27.tgz
sha:3133415905b9b46d152d064865d52f32eee4fcbeb0e8a69e3510caeaae0c56a9
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/elfutils
bld/auto/archive
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
