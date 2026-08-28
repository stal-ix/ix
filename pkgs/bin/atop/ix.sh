{% extends '//die/c/make.sh' %}

{% block pkg_name %}
atop
{% endblock %}

{% block version %}
2.13.0
{% endblock %}

{% block fetch %}
https://www.atoptool.nl/download/atop-{{self.version().strip()}}.tar.gz
ea182f84c9f52ca922e5af4f17dff97ff424400a4f2f92393317a6af66e6a874
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/glib
lib/kernel
lib/curses
{% endblock %}

{% block bld_tool %}
bin/getopt
bld/pkg/config
{% endblock %}

{% block patch %}
sed -e 's|/bin/systemctl|qqq|g' -i Makefile
sed -e 's|^#define _XOPEN_SOURCE$|#define _XOPEN_SOURCE 700|' -i *.c
{% endblock %}

{% block cpp_missing %}
time.h
{% endblock %}

{% block make_flags %}
BINPATH=${out}/bin
SBINPATH=${out}/bin
SCRPATH=${out}/share/atop
LOGPATH=${out}/var/log/atop
MAN1PATH=${out}/share/man/man1
MAN5PATH=${out}/share/man/man5
MAN8PATH=${out}/share/man/man8
INIPATH=${out}/etc/init.d
DEFPATH=${out}/etc/default
SYSDPATH=${out}/share/systemd/system
CRNPATH=${out}/etc/cron.d
ROTPATH=${out}/etc/logrotate.d
PMPATH1=${out}/share/pm-utils/sleep.d
PMPATH2=${out}/share/pm-utils/sleep.d
PMPATHD=${out}/share/systemd/system-sleep
{% endblock %}
