{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v6.2.tar.xz
sha:5fa59b9304bec59a8f0cb505f60c95d8c46b2948389033ad9d3cd72928bfd144
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

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed \
        -e 's|.*sha256_init_accel.*;.*||' \
        -e 's|.*blake2_init_accel.*;.*||' \
        -i ${l}
done
{% endblock %}
