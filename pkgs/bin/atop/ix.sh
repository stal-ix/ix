{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.atoptool.nl/download/atop-2.11.0.tar.gz
sha:9b94c666602efff7bf402ecce706c347f38c39cb63498f9d39626861e5646e20
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
