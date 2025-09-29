{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iwd
{% endblock %}

{% block version %}
3.10
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-{{self.version().strip()}}.tar.xz
640bff22540e1714f71772a83123aff6f810b7eb9d7d6df1e10fb2695beb5115
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
