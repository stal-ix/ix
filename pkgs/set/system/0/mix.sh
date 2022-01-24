{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
aux/etc

bin/iw
bin/runit

bin/busybox/full

bin/nano
bin/seatd
bin/mdevd/sys
bin/openssh
bin/iwd/sys
bin/yash/sys
bin/dbus/sys
bin/net/tools
bin/dhcpcd/sys
#bin/agetty/sys
bin/mingetty/sys
{% endblock %}
