{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.10/strace-6.10.tar.xz
sha:765ec71aa1de2fe37363c1e40c7b7669fc1d40c44bb5d38ba8e8cd82c4edcf07
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
