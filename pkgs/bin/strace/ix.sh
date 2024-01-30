{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.7/strace-6.7.tar.xz
sha:2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7
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
