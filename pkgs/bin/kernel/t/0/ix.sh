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
bin/pahole
bld/python
bin/openssl
{% endblock %}

{% block mk_flags %}
CC=${FREESTANDING_CLANG}
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

{# LLVM fa02a6ed lowers more switch statements to lookup tables; in the -fPIE
   decompressor those carry run-time relocations that vmlinux.lds.S rejects
   ("Unexpected run-time relocations (.rela) detected!"). Upstream fix
   "x86/boot/compressed: Disable jump tables" (Cc stable) is in 7.1.13+;
   add it where a tree does not have it yet. #}
{% block patch %}
{{super()}}
grep -q -- '-fno-jump-tables' arch/x86/boot/compressed/Makefile || \
    sed -e '/^KBUILD_CFLAGS += -fno-strict-aliasing -fPIE$/a KBUILD_CFLAGS += -fno-jump-tables' -i arch/x86/boot/compressed/Makefile
grep -q -- '-fno-jump-tables' arch/x86/boot/compressed/Makefile
{% endblock %}

{% block configure %}
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
