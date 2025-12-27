{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.38
{% endblock %}

{% block fetch %}
https://gitlab.com/lvmteam/lvm2/-/archive/v{{self.version().strip().replace('.', '_')}}/lvm2-v{{self.version().strip().replace('.', '_')}}.tar.bz2
614e725d10f47d5ef9f8d5d3467eb9a10ee757d05ecd5a986eee6cedefec481b
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
wrap_rdynamic
{% endblock %}
