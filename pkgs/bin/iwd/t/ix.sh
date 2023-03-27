{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-2.4.tar.xz
sha:3a9c5e7ade45162e5c78b3d7035a2f4a6e20ba6b5974097c35a8f615493012f9
{% endblock %}

{% block bld_libs %}
lib/c
lib/ell
lib/kernel
{% endblock %}

{% block configure_flags %}
--enable-external-ell
--disable-systemd-service
--libexecdir=${out}/bin
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/var ${out}/etc
{% endblock %}

{% block cpp_missing %}
sys/time.h
{% endblock %}
