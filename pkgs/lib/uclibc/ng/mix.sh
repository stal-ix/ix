{% extends '//mix/template/kconfig.sh' %}

{% block fetch %}
https://downloads.uclibc-ng.org/releases/1.0.39/uClibc-ng-1.0.39.tar.xz
ceeb95430ec00cc6f8006f746605be1d
{% endblock %}

{% block lib_deps %}
lib/build
lib/linux
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block c_compiler %}
bin/gcc/tc(for_target={{host.gnu.three}})
bin/gcc/tc(for_target={{target.gnu.three}})
{% endblock %}

{% block kconfig_flags %}
KERNEL_HEADERS="${lib_linux}/include"
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/"
{% include 'cfg' %}
{% endblock %}

{% block patch %}
base64 -d << EOF > extra/scripts/gen_bits_syscall_h.sh
{% include 'gen.sh/base64' %}
EOF
{% endblock %}

{% block kconfig_target %}
olddefconfig
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

cc -c -o crti.o -x c - << EOF
void _init() {
}

void _fini() {
}
EOF

ar q libcrt.a *.o
rm *.o
ranlib *.a
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-fno-pic -fno-pie -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
export CMFLAGS="-DLIBCXX_ENABLE_LOCALIZATION=OFF \${CMFLAGS}"
{% endblock %}
