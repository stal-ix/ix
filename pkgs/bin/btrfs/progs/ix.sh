{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v5.18.tar.xz
sha:1de6107622b0be2f6d77261f97a2bdd40291dbb682aac7dce08632d171f7a134
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lzo
lib/zstd
lib/udev
lib/linux
lib/execinfo
lib/e2fsprogs
bin/util/linux
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block configure_flags %}
--disable-documentation
--disable-python
{% endblock %}
