{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/sabotage-linux/netbsd-curses/archive/refs/tags/v0.3.2.tar.gz
sha:9d3ebd651e5f70b87b1327b01cbd7e0c01a0f036b4c1371f653b7704b11daf23
{% endblock %}

{% block cpp_defines %}
__pure=
TERMINFO_COMPAT=1
{% endblock %}

{% block patch %}
cat << EOF >> netbsd_sys/cdefs.h
#undef __strong_alias
#define __strong_alias(a, b)
EOF

sed -e 's|fpurge|curses_fpurge|' -i libcurses/tty.c
{% endblock %}

{% block make_flags %}
STATIC_BINS=yes
HOSTCC=${HOST_CC}
{% endblock %}

{% block make_target %}
all-static
{% endblock %}

{% block make_install_target %}
install-static
{% endblock %}

{% block env %}
export COFLAGS="--with-curses=${out} --with-ncurses=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
