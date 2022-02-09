{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/iw
bin/sud
bin/iwd/sys
bin/runit/sys
bin/dbus/runit
bin/openresolv
bin/seatd/runit
bin/dhcpcd/runit
bin/mingetty/sys
bin/sched/trashdir

aux/etc
bin/busybox/full
{% endblock %}
