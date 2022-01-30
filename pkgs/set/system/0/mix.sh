{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/iw
bin/sud
bin/killd
#bin/priod
bin/iwd/sys
bin/runit/sys
bin/dbus/runit
bin/seatd/runit
bin/dhcpcd/runit
bin/mingetty/sys
bin/busybox/full
aux/etc
{% endblock %}
