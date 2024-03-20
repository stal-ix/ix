{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.8/strace-6.8.tar.xz
sha:ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/iberty
lib/elfutils
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-mpers=no
--with-libdw
--with-libiberty
--enable-gcc-Werror=no
--disable-gcc-Werror
{% endblock %}
