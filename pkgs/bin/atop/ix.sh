{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.atoptool.nl/download/atop-2.9.0.tar.gz
sha:bc355ebd7af3f9c6f01be2ff50e581622d24f5ea0d8d5f3366e2fd1311ab98f8
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/kernel
lib/curses
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
