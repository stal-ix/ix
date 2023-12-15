{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v6.6.3.tar.xz
sha:f41ce53f6673ff551ee4a3fe7dc9601e5a0dde6b6d09177d1fab62718abc6d9a
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
{% endblock %}

{% block configure_flags %}
--with-crypto=libgcrypt
--disable-documentation
--disable-python
{% endblock %}
