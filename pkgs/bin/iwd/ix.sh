{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-1.28.tar.xz
sha:ee538c720ad15335ece81a52a4b8a11820236df9ed9a5a72a2e64d74c652f0b0
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
