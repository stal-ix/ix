{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/busybox/full
aux/etc
bin/iw
bin/sud
bin/nano
bin/killd
bin/iwd/sys
bin/dbus/sys
bin/runit/sys
bin/net/tools
bin/mdevd/sys
bin/seatd/runit
bin/dhcpcd/runit
bin/mingetty/sys
{% endblock %}
