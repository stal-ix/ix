{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iwd
{% endblock %}

{% block version %}
3.7
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-{{self.version().strip()}}.tar.xz
sha:ba3e577a61e78f860f376025c3243bbf19eac7ccbfdfac3aebe566556ace2e08
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
