{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btrfs-progs
{% endblock %}

{% block version %}
7.1
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v{{self.version().strip()}}.tar.xz
d1f55cc2971398c9142eaa79d203e63d586a3b4b867f956664a1d68322cd4e34
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
