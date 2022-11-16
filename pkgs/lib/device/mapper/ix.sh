{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.2.03.17.tgz
sha:7286cfa9651828c589389509546333b8da965dfa84a1a4c8ab3e681a47fabae7
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

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
