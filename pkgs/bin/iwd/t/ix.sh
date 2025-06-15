{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iwd
{% endblock %}

{% block version %}
3.9
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-{{self.version().strip()}}.tar.xz
0cd7dc9b32b9d6809a4a5e5d063b5c5fd279f5ad3a0bf03d7799da66df5cad45
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
