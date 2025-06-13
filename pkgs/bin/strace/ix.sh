{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
strace
{% endblock %}

{% block version %}
6.15
{% endblock %}

{% block fetch %}
https://strace.io/files/{{self.version().strip()}}/strace-{{self.version().strip()}}.tar.xz
8552dfab08abc22a0f2048c98fd9541fd4d71b6882507952780dab7c7c512f51
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
