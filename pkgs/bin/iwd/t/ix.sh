{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-2.20.tar.xz
sha:86827b97cb5b19ddecce36568c59378da2fae8cf37a0e2b9eacd1269f24c6f8e
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
