{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v6.3.2.tar.xz
sha:a9f26199d5817816f5b0a8f0f63763f3fb0143a20388a929b742dcad5bf27c24
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
