{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-1.29.tar.xz
sha:71533fe3b8f6381f24832198ba11d00f04a361454770c173b3b66bc3cdf272bd
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

{% block setup %}
export CPPFLAGS="-include sys/time.h ${CPPFLAGS}"
{% endblock %}
