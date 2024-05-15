{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.9/strace-6.9.tar.xz
sha:da189e990a82e3ca3a5a4631012f7ecfd489dab459854d82d8caf6a865c1356a
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
