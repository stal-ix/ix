{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v6.1.3.tar.xz
sha:d37fc9ec4fa5778b20aa7548fe706eb3a300338c1473318271ae54024dac7167
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

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block configure_flags %}
--with-crypto=libgcrypt
--disable-documentation
--disable-python
{% endblock %}
