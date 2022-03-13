{% extends '//mix/autohell.sh' %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.2.03.14.tgz
sha:4a63bc8a084a8ae3c7bc5e6530cac264139d218575c64416c8b99e3fe039a05c
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/python
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

{% import '//mix/hooks.sh' as hooks %}

{% block setup_tools %}
{{hooks.wrap_c_compilers()}}

cat << EOF > readelf
#!$(which sh)
EOF

chmod +x readelf
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
