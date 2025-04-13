{% extends '//die/c/autorehell.sh' %}

{% block version %}
3.6
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-{{self.version().strip()}}.tar.xz
sha:cc5e02068d7407b9dac000429d667af32e9d91c7bff3183a241d8fdb0f75734b
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
