{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-1.27.tar.xz
sha:013b4a0a79629c20d915954fc3b5d0620ef6e0d6065db3c342f4b3f9111f46ec
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
