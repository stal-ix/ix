{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v5.17.tar.xz
sha:63b778fe4c2bad18e371dce58ed35488e08f583921367454fdd88507a3d0d89e
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
