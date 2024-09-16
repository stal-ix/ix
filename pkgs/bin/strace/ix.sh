{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.11/strace-6.11.tar.xz
sha:83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab6e4883626e283a5
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
