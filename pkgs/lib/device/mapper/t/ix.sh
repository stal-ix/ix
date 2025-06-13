{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.32
{% endblock %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.{{self.version().strip()}}.tgz
2917832ddd4e46e593651e022bf122fd267ab5e6f74faee082484388c886d1ad
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
