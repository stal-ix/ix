{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v6.0.tar.xz
sha:469e1b2ec842a6e64848ae63de3022446f8009e975f7beb919191f137cbdd534
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lzo
lib/zstd
lib/udev
lib/linux
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
