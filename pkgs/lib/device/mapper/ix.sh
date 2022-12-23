{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.2.03.18.tgz
sha:9f683e2980d95c0dcebbd25c7c177032c5615d7267bfc885eabfce59280f4769
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
