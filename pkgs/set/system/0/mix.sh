{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
aux/etc
bin/iw
bin/nano
bin/runit
bin/openssh
bin/net/tools

bin/busybox/full

bin/seatd
bin/mdevd
bin/iwd/sys
bin/yash/sys
bin/dbus/sys
bin/dhcpcd/sys
bin/mingetty/sys
bin/wpa/supplicant
{% endblock %}
