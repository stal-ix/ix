{% extends '//die/c/kconfig.sh' %}

{% block pkg_name %}
uclibc-ng
{% endblock %}

{% block version %}
1.0.46
{% endblock %}

{% block fetch %}
http://downloads.uclibc-ng.org/releases/{{self.version().strip()}}/uClibc-ng-{{self.version().strip()}}.tar.xz
d6eb01fced11c5e3b319bf4132d67685b1c33494426e9426032e31979d7d8ad7
{% endblock %}

{% block lib_deps %}
lib/build
lib/kernel
{% endblock %}

{% block host_libs %}
{{super()}}
lib/build/muldefs
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block c_compiler %}
bin/gcc(for_target={{host.gnu.three}})
bin/gcc(for_target={{target.gnu.three}})
{% endblock %}

{% block kconfig_flags %}
KERNEL_HEADERS="${KERNEL_HEADERS}"
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/"
{% include 'cfg' %}
{% endblock %}

{% block patch %}
sed -e "s|/tmp/|${TMPDIR}/|" -i Rules.mak
base64 -d << EOF > extra/scripts/gen_bits_syscall_h.sh
{% include 'gen.sh/base64' %}
EOF
{% endblock %}

{% block kconfig_target %}
olddefconfig
{% endblock %}

{% block build_flags %}
shut_up
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

{% block env %}
export CPPFLAGS="-fno-pic -fno-pie -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
export CMFLAGS="-DLIBCXX_ENABLE_LOCALIZATION=OFF \${CMFLAGS}"
{% endblock %}
