{% extends '//mix/template/kconfig.sh' %}

{% block step_unpack %}
cd /home/mix/sources/linux-5.16.2
{% endblock %}

{% block host_libs %}
lib/elfutils
lib/openssl/1
lib/linux/new
{{super()}}
{% endblock %}

{% block c_compiler %}
bin/gcc/tc(for_target={{host.gnu.three}})
bin/gcc/tc(for_target={{target.gnu.three}})
{% endblock %}

{% block bld_tool %}
bld/perl
bin/flex
bin/gzip
bin/bison/3/6
bin/busybox/bc
{% endblock %}

{% block configure %}
:
#make HOSTCC=${HOST_CC} mrproper
#make HOSTCC=${HOST_CC} defconfig
{% endblock %}

{% block build %}
make HOSTCC=${HOST_CC} -j 16
{% endblock %}

{% block setup_target_tc %}
{{super()}}
ln -s target/ld ld
ln -s target/strip strip
ln -s target/objcopy objcopy
ln -s target/objdump objdump
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp arch/x86/boot/bzImage ${out}/bin/kernel.{{kernel_ver}}
cp .config ${out}/bin/kernel.config
{% endblock %}
