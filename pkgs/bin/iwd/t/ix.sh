{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iwd
{% endblock %}

{% block version %}
3.11
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-{{self.version().strip()}}.tar.xz
85730e79de05978e26e44b958fd11e2ebb45424ca181f8db7a8daf25fc2226ea
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
