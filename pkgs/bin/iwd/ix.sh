{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/network/wireless/iwd-2.0.tar.xz
sha:5a0bfbc567092476d60a8f9700f68a273e39fd46e7177ce2d69bbc74255a930c
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
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

{% block cpp_missing %}
sys/time.h
{% endblock %}
