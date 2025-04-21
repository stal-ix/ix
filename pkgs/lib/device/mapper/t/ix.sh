{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.31
{% endblock %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.{{self.version().strip()}}.tgz
sha:5db2956a00fbf87d92274cccc92436387ec0c3faadece7413ece1ba1c10c98ff
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
