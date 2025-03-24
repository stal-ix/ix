{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/6.12/strace-6.12.tar.xz
sha:c47da93be45b6055f4dc741d7f20efaf50ca10160a5b100c109b294fd9c0bdfe
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
