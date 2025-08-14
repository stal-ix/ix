{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
strace
{% endblock %}

{% block version %}
6.16
{% endblock %}

{% block fetch %}
https://strace.io/files/{{self.version().strip()}}/strace-{{self.version().strip()}}.tar.xz
3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa
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
