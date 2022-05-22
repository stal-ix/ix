{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/sabotage-linux/netbsd-curses/archive/refs/tags/v0.3.2.tar.gz
8798fe3e6acce82cb08e39b1532b4664
{% endblock %}

{% block cpp_defines %}
__pure=
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
{% endblock %}

{% block make_target %}
all-static
{% endblock %}

{% block make_install_target %}
install-static
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-curses=${out} --with-ncurses=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
