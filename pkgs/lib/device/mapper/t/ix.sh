{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lvm2
{% endblock %}

{% block version %}
2.03.33
{% endblock %}

{% block fetch %}
https://gitlab.com/lvmteam/lvm2/-/archive/v{{self.version().strip().replace('.', '_')}}/lvm2-v{{self.version().strip().replace('.', '_')}}.tar.bz2
b574a8bcdd6638ddce6e0a5e80f42e10b393fc2c8038594a296de6a6d5cc1a9c
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
