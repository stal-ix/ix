{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-2.1.tar.xz
sha:60fc17a6e765545e36ce75abe28d896f822eaf81ac1f61498ca631585cbde227
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--with-dbus-datadir=${out}/etc
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
