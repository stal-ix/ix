{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.37
{% endblock %}

{% block fetch %}
https://gitlab.com/lvmteam/lvm2/-/archive/v{{self.version().strip().replace('.', '_')}}/lvm2-v{{self.version().strip().replace('.', '_')}}.tar.bz2
09b5996191bfd6cb47e8f182dea786639fb1baa5b57faad63dfaa69def64b25e
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
