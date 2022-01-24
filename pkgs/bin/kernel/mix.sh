{% extends '//mix/template/kconfig.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
lib/elfutils
lib/openssl/1
bin/kernel/headers
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
make HOSTCC=${HOST_CC} mrproper

base64 -d << EOF > .config
{% include 'cfg/base64' %}
EOF
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
cp arch/x86/boot/bzImage ${out}/bin/kernel
cp .config ${out}/bin/kernel.config
{% endblock %}
