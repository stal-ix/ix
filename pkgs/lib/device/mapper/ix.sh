{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.2.03.24.tgz
sha:593c5503ba00faab1c6e0b4a597b9605ec7b5881845c04bf412ebf9d1bbfa13c
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

{% block configure_flags %}
--enable-pkgconfig
--enable-static_link
{% endblock %}

{% block make_target %}
device-mapper
{% endblock %}

{% block make_install_target %}
install_device-mapper
{% endblock %}
