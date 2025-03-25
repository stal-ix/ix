{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.14/strace-6.14.tar.xz
sha:244f3b5c20a32854ca9b7ca7a3ee091dd3d4bd20933a171ecee8db486c77d3c9
{% endblock %}

{% block bld_libs %}
lib/c
lib/uring
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
