{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iw
bin/mix
bin/sud
bin/iwd/runit
bin/runit/sys
bin/dbus/runit
bin/openresolv
bin/acpid/runit
bin/seatd/runit
bin/dhcpcd/runit
bin/ananicy/runit
bin/mingetty/runit
bin/sched/trashdir(delay=100)

etc
bin/busybox
bin/busybox/syslogd
bin/busybox/ntpd(delay=100)
{% endblock %}

{% block run_data %}
aux/tzdata
{% endblock %}
