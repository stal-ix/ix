{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/tytso/e2fsprogs/archive/refs/tags/v1.46.6.tar.gz
sha:9aba7176751fd8c50a1c5a49dd86192a5fe45a25d13cf62390977541d5d03bfe
#broke bin/btrfs/progs
#https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.1/e2fsprogs-1.47.1.tar.xz
#sha:5a33dc047fd47284bca4bb10c13cfe7896377ae3d01cb81a05d406025d99e0d1
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block lib_deps %}
lib/c
lib/linux/util
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/texinfo
bld/auto/archive
{% endblock %}

{% block configure_flags %}
--with-crond-dir=no
--with-udev-rules-dir=no
--with-systemd-unit-dir=no
--disable-libuuid
--disable-libblkid
{% endblock %}
