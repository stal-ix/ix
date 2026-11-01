{# The x86 BIOS for qemu machine types 2.0 and newer, built the way qemu
   builds its bios-256k.bin. SeaBIOS itself needs gcc, clang lacks its flags;
   its kconfig is a host tool and builds with the usual cc. #}

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
seabios
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block fetch %}
https://www.seabios.org/downloads/seabios-{{self.version().strip()}}.tar.gz
5159a35fac5c1579dd5d702001033c826ce45d30d3bd657ec1b2695455997712
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/python
bin/gcc/14(bin_prefix={{target.gnu.three}})
bin/binutils(bin_prefix={{target.gnu.three}})
{% endblock %}

{% block build %}
cat << EOF > .config
CONFIG_QEMU=y
CONFIG_ROM_SIZE=256
CONFIG_ATA_DMA=n
EOF
T={{target.gnu.three}}
BD="-B$(dirname $(which ${T}ld))/${T}/ -B$(dirname $(which ${T}as))/${T}/"
make CROSS_PREFIX=${T} CC="${T}gcc ${BD}" HOSTCC=cc PYTHON=python3 EXTRAVERSION=-ix olddefconfig
make CROSS_PREFIX=${T} CC="${T}gcc ${BD}" HOSTCC=cc PYTHON=python3 EXTRAVERSION=-ix
{% endblock %}

{% block install %}
mkdir -p ${out}/share/qemu
cp out/bios.bin ${out}/share/qemu/bios-256k.bin
{% endblock %}
