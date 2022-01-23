{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-1.21.tar.xz
sha:bac891df91c605271e91b73cf0015e1ba86ff784347e53fc67601366859b3851
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/readline
{% endblock %}

{% block configure_flags %}
--with-dbus-datadir=${out}/etc
--disable-systemd-service
--libexecdir=${out}/bin
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/var
{% endblock %}
