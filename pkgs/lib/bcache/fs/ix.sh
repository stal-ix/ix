{% extends '//die/c/make.sh' %}

{% include '//bin/bcache/fs/tools/ver.sh' %}

{% block fetch %}
{{self.cargo_url()}}
{{self.http_sha()}}
{% endblock %}

{% block lib_deps %}
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
{% endblock %}

{% block bld_libs %}
lib/shim/fake/pkg(pkg_name=udev,pkg_ver=1)
{% endblock %}

{% block bld_tool %}
bin/zstd
bld/pkg/config
{% endblock %}

{% block make_target %}
libbcachefs.a
{% endblock %}

{% block make_flags %}
ROOT_SBINDIR=${out}/bin
INITRAMFS_DIR=${out}/share/initramfs-tools
PKGCONFIG_UDEVDIR=${out}/share/udev
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libbcachefs.a ${out}/lib/libbcachefs_real.a
{% endblock %}

{% block c_rename_symbol %}
crc32c
{% endblock %}
