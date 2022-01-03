{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://downloads.uclibc-ng.org/releases/1.0.39/uClibc-ng-1.0.39.tar.xz
ceeb95430ec00cc6f8006f746605be1d
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block host_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
dev/tool/python
{% endblock %}

{% block c_compiler %}
dev/lang/gcc/tc(for_target={{target.gnu.three}})
{% endblock %}

{% block configure %}
cat << EOF >> extra/Configs/Config.x86_64
{% include 'cfg' %}
EOF

make HOSTCC=${HOST_CC} defconfig
{% endblock %}

{% block make_flags %}
HOSTCC=${HOST_CC}
{% endblock %}

{% block patch %}
base64 -d << EOF > extra/scripts/gen_bits_syscall_h.sh
{% include 'gen_bits_syscall_h.sh/base64' %}
EOF
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mv usr/*uclibc/usr/* ./
rm -r usr
{% endblock %}
