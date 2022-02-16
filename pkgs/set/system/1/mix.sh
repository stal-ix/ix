{% extends '//mix/hub.sh' %}

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
bin/mingetty/runit
bin/sched/trashdir(delay=100)

aux/etc
bin/busybox/full
bin/busybox/syslogd
{% endblock %}
