{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
aux/etc
bin/runit/sys
bin/busybox/full

bin/iw
bin/nano
bin/openssh
bin/iwd/sys
bin/yash/sys
bin/dbus/sys
bin/net/tools
bin/mdevd/sys
bin/dhcpcd/sys
bin/seatd/runit
bin/mingetty/sys
{% endblock %}
