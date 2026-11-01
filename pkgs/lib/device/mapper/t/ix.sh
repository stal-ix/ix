{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.44
{% endblock %}

{% block fetch %}
https://gitlab.com/lvmteam/lvm2/-/archive/v{{self.version().strip().replace('.', '_')}}/lvm2-v{{self.version().strip().replace('.', '_')}}.tar.bz2
136c2850903295c7f0c3f87c9560d358315388097064dcd3c8601b66de2f59e8
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
