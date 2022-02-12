{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v5.16.tar.xz
sha:38ab3cd19d4156226cacd6926972f866a77b76ec3b9677d9888efb9530a31833
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lzo
lib/zstd
lib/udev
lib/linux
lib/execinfo
bin/e2fsprogs
bin/util/linux
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block configure_flags %}
--disable-documentation
--disable-python
{% endblock %}
