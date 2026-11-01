{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btrfs-progs
{% endblock %}

{% block version %}
7.3
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v{{self.version().strip()}}.tar.xz
d37b63403d25fe025704c758e6a3da0979ae50c30c5f02aa78e4410e7b346e3a
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
