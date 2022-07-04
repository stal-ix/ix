{% extends '//die/make.sh' %}

{% block fetch %}
https://www.atoptool.nl/download/atop-2.7.1.tar.gz
sha:ca48d2f17e071deead5e6e9cc9e388bf6a3270d695e61976b3794d4d927b5c4e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/linux
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
