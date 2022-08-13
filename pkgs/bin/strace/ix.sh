{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/5.19/strace-5.19.tar.xz
sha:aa3dc1c8e60e4f6ff3d396514aa247f3c7bf719d8a8dc4dd4fa793be786beca3
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/elfutils
{% endblock %}

{% block configure_flags %}
--enable-mpers=no
--with-libdw
{% endblock %}
