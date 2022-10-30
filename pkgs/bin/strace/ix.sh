{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.0/strace-6.0.tar.xz
sha:92d720a666855e9f1c6a11512fd6e99674a82bbfe1442557815f2ce8e1293338
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/iberty
lib/elfutils
{% endblock %}

{% block configure_flags %}
--enable-mpers=no
--with-libdw
--with-libiberty
--enable-gcc-Werror=no
--disable-gcc-Werror
{% endblock %}
