{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.3/strace-6.3.tar.xz
sha:e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731
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
