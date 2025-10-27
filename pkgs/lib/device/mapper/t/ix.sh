{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.36
{% endblock %}

{% block fetch %}
https://gitlab.com/lvmteam/lvm2/-/archive/v{{self.version().strip().replace('.', '_')}}/lvm2-v{{self.version().strip().replace('.', '_')}}.tar.bz2
4e3dad829a51a86a620de590a1d2348997b1ae7da7fa86b28660266a0ae5f62e
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
