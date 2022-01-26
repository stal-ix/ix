{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/iw
bin/sud
bin/nano
bin/killd
bin/iwd/sys
bin/dbus/sys
bin/runit/sys
bin/net/tools
#bin/mdevd/sys
bin/seatd/runit
bin/dhcpcd/runit
bin/mingetty/sys
bin/busybox/full
aux/etc
{% endblock %}
