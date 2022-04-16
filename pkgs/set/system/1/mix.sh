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

etc
bin/busybox
bin/busybox/ntpd
bin/busybox/syslogd
{% endblock %}

{% block run_data %}
aux/tzdata
{% endblock %}
