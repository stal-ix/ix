{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
strace
{% endblock %}

{% block version %}
6.17
{% endblock %}

{% block fetch %}
https://strace.io/files/{{self.version().strip()}}/strace-{{self.version().strip()}}.tar.xz
0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0
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
