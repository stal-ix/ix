{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.atoptool.nl/download/atop-2.8.1.tar.gz
sha:970058a19b79c3444f971f854572a0e63891dc2d5f7037ff837570854ce0da1e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/kernel
lib/curses
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
