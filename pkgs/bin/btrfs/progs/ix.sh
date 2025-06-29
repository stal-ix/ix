{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btrfs-progs
{% endblock %}

{% block version %}
6.15
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v{{self.version().strip()}}.tar.xz
57da428dd2199fd88d83ecf1cad05678ce78640ef7e52d7633be9887cef674bb
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
