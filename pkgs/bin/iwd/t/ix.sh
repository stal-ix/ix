{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-3.0.tar.xz
sha:bd167ab368b6ba302b6c948a4f41f02d233a12e20d5094b1c0393325309f8a60
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
