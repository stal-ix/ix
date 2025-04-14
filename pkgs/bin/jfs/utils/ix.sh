{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jfsutils
{% endblock %}

{% block version %}
1.1.15
{% endblock %}

{% block fetch %}
http://jfs.sourceforge.net/project/pub/jfsutils-{{self.version().strip()}}.tar.gz
sha:244a15f64015ce3ea17e49bdf6e1a0fb4f9af92b82fa9e05aa64cb30b5f07a4d
{% endblock %}

{% block bld_libs %}
lib/c
lib/e2fsprogs
lib/shim/gnu/basename/overlay
{% endblock %}

{% block cpp_defines %}
_PATH_MNTTAB=\\\"/proc/mounts\\\"
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}

{% block cpp_missing %}
sys/sysmacros.h
stdint.h
{% endblock %}
