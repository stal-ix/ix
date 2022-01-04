{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://downloads.uclibc-ng.org/releases/1.0.39/uClibc-ng-1.0.39.tar.xz
ceeb95430ec00cc6f8006f746605be1d
{% endblock %}

{% block lib_deps %}
lib/build
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
dev/lang/gcc/tc(for_target={{host.gnu.three}})
dev/lang/gcc/tc(for_target={{target.gnu.three}})
{% endblock %}

{% block patch %}
cat << EOF >> extra/Configs/defconfigs/x86_64/defconfig
KERNEL_HEADERS=${lib_linux}/include

HAVE_SHARED=n
ARCH_HAS_NO_SHARED=y
ARCH_HAS_NO_LDSO=y

UCLIBC_CTOR_DTOR=y

HAS_NO_THREADS=n
UCLIBC_HAS_THREADS_NATIVE=y
UCLIBC_HAS_THREADS=y
UCLIBC_HAS_TLS=y

MALLOC_SIMPLE=n
MALLOC_STANDARD=y

UCLIBC_HAS_UTMPX=y

UCLIBC_HAS_EPOLL=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
UCLIBC_HAS_IPV6=y
UCLIBC_USE_NETLINK=y
UCLIBC_SUPPORT_AI_ADDRCONFIG=y
UCLIBC_HAS_RESOLVER_SUPPORT=y

UCLIBC_HAS_PTY=y
UCLIBC_HAS_WCHAR=y

DO_C99_MATH=y
UCLIBC_HAS_FPU=y
UCLIBC_HAS_FENV=y
UCLIBC_HAS_LONG_DOUBLE_MATH=y

UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GETOPT_LONG=y
UCLIBC_HAS_GNU_GETSUBOPT=y
UCLIBC_HAS_ARGP=y

UCLIBC_HAS_GLOB=y
UCLIBC_HAS_REGEX=y
UCLIBC_HAS_FNMATCH=y
UCLIBC_HAS_WORDEXP=y

UCLIBC_SUSV2_LEGACY=y
UCLIBC_SUSV3_LEGACY=y
EOF

base64 -d << EOF > extra/scripts/gen_bits_syscall_h.sh
{% include 'gen.sh/base64' %}
EOF
{% endblock %}

{% block configure %}
make HOSTCC=${HOST_CC} defconfig
{% endblock %}

{% block make_flags %}
HOSTCC=${HOST_CC}
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mv usr/*uclibc/usr/* ./
rm -r usr

cd lib

rm crti.o

cat << EOF > crti.c
void _init() {
}

void _fini() {
}
EOF

cc -c crti.c

ar q libcrt.a *.o
rm *.o
ranlib *.a
{% endblock %}

{% block env %}
export CPPFLAGS="-fno-pic -fno-pie -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
