{# The option ROMs qemu loads for direct kernel boot (linuxboot_dma.bin)
   and friends, built from its own sources by the freestanding clang. #}

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
qemu
{% endblock %}

{% block version %}
11.1.2
{% endblock %}

{% block fetch %}
https://download.qemu.org/qemu-{{self.version().strip()}}.tar.xz
731b5681e4bb18be313231579b8efd0296c5b015fa36dc533874b639ba838016
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block build %}
src=${PWD}
inc=$(dirname $(dirname $(which ${FREESTANDING_CLANG})))/share/include
cd pc-bios/optionrom
printf 'TOPSRC_DIR=%s\nCC=%s\nEXTRA_CFLAGS=-isystem %s -fuse-ld=lld -no-pie -static\nOBJCOPY=llvm-objcopy\nPYTHON=python3\n' \
    "${src}" "${FREESTANDING_CLANG}" "${inc}" > config.mak
# -static: without it the driver puts .interp in front of .text. The
# Makefile appends to CPPFLAGS from the environment, which is for userspace.
env -u CPPFLAGS -u CFLAGS -u LDFLAGS make V=1
{% endblock %}

{% block install %}
mkdir -p ${out}/share/qemu
cp pc-bios/optionrom/*.bin ${out}/share/qemu/
{% endblock %}
