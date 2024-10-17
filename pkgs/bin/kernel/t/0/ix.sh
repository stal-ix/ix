{% extends '//die/c/kconfig.sh' %}

{% block task_pool %}full{% endblock %}

{% block host_libs %}
lib/elfutils
lib/openssl/1
lib/build/kernel
lib/build/noexec
lib/build/muldefs
{{super()}}
{% endblock %}

{% block bld_tool %}
bin/xz
bld/bc
bld/flex
bin/gzip
bin/zstd
bld/perl
bld/bison
bld/python
bin/openssl
{% endblock %}

{% block mk_flags %}
CC=clang-19
LD=ld.lld
AR=llvm-ar
NM=llvm-nm
STRIP=llvm-strip
OBJCOPY=llvm-objcopy
OBJDUMP=llvm-objdump
READELF=llvm-readelf
HOSTCC=${HOST_CC}
HOSTCXX=${HOST_CXX}
HOSTAR=llvm-ar
HOSTLD=ld.lld
{% endblock %}

{% block configure %}
clang-19 --help
make {{self.mk_flags().replace('\n', ' ')}} mrproper
cat << EOF > .config
{% block kconfig_flags %}
{% endblock %}
EOF
{% endblock %}

{% block build %}
make {{self.mk_flags().replace('\n', ' ')}} -j ${make_thrs}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp arch/x86/boot/bzImage ${out}/bin/kernel-{{self.kernel_name().strip()}}
{% endblock %}
