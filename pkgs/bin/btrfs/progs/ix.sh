{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btrfs-progs
{% endblock %}

{% block version %}
6.17
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v{{self.version().strip()}}.tar.xz
277d696c9d79713ff5afb53c7efebdcead2e6a6007789b1742ec411f4e4ca229
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lzo
lib/zstd
lib/udev
lib/kernel
lib/gcrypt
lib/execinfo
lib/e2fsprogs
lib/linux/util
lib/shim/gnu/basename/overlay
{% endblock %}

{% block configure_flags %}
--with-crypto=libgcrypt
--disable-documentation
--disable-python
{% endblock %}

{% block patch %}
>libbtrfsutil/stubs.c
{% endblock %}

{% block c_rename_symbol %}
parse_range
{% endblock %}
