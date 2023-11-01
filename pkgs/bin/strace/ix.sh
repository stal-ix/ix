{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.6/strace-6.6.tar.xz
sha:421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c
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
