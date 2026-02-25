{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btrfs-progs
{% endblock %}

{% block version %}
6.19
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v{{self.version().strip()}}.tar.xz
ad6b791a60eb563d3314bc18e3c47f6b053a032639488b5b09b9d5e7921de6b6
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
