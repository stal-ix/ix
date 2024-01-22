{% extends '//die/c/make.sh' %}

{% block fetch %}
https://evilpiepirate.org/bcachefs-tools/bcachefs-tools-1.4.1.tar.zst
sha:b73b81af2ee7fea1ddad57dacf8ebeb443f9dca8cccde41d56eb1da1736884b5
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/aio
lib/lz4
lib/zstd
lib/urcu
lib/udev
lib/kernel
lib/sodium
lib/key/utils
lib/linux/util
bin/bcachefs/tools/shim
lib/shim/fake/pkg(pkg_name=udev,pkg_ver=1)
{% endblock %}

{% block bld_tool %}
bin/zstd
bld/pkg/config
{% endblock %}

{% block cpp_defines %}
pwritev2=pwritev
crc32c=crc32c_bcachefs
{% endblock %}

{% block make_flags %}
NO_RUST=1
ROOT_SBINDIR=${out}/bin
INITRAMFS_DIR=${out}/share/initramfs-tools
PKGCONFIG_UDEVDIR=${out}/share/udev
{% endblock %}

{% block patch %}
sed -e 's|.*UDEVDIR.*udevdir.*||' -i Makefile
{% endblock %}
