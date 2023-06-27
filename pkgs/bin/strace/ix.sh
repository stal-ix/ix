{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.4/strace-6.4.tar.xz
sha:27987dbac57fdfd260c6db4dc8328df35c95c6867c8a3d4371d59cdcf4eb9238
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
