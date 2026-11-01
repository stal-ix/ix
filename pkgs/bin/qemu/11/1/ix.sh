{# A headless x86_64 qemu for virtual machines on servers: KVM, user-mode
   networking, disks over http and NBD. No firmware from the tarball: the BIOS is
   aux/seabios, the option ROMs aux/qemu/roms. #}

{% extends '//bin/qemu/t/ix.sh' %}

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

{% block bld_libs %}
lib/c
lib/z
lib/fdt
lib/curl
lib/glib
lib/slirp
lib/kernel
lib/pixman
lib/ucontext
lib/shim/fake(lib_name=stdc++)
lib/shim/gnu/basename/overlay
{% endblock %}

{% block bld_tool %}
bld/perl
bld/make
bld/ninja
bld/python/13
bld/pkg/config
{% endblock %}

{% block configure_flags %}
--prefix=${out}
--libexecdir=${out}/bin/{{uniq_id}}
--without-default-features
--enable-system
--enable-tools
--enable-kvm
--enable-tcg
--enable-slirp
--enable-curl
--enable-pixman
--enable-fdt=system
--disable-docs
--disable-install-blobs
--with-coroutine=ucontext
--target-list=x86_64-softmmu
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*tests.*||' -i meson.build
# the tooling group is for tests and wants setuptools from PyPI
sed -e 's|pythondeps.toml tooling|pythondeps.toml meson|' -i configure
{{super()}}
{% endblock %}
