{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
strace
{% endblock %}

{% block version %}
7.3
{% endblock %}

{% block fetch %}
https://strace.io/files/{{self.version().strip()}}/strace-{{self.version().strip()}}.tar.xz
529634c40910895a9a1f3c5c1e65da2ca9ed72fb158dfc4bcc89efdf05e39b72
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
