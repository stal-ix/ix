{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.5/strace-6.5.tar.xz
sha:dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980
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
