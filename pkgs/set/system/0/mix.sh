{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
aux/etc
bin/iw
bin/nano
bin/runit
bin/seatd
bin/mdevd
bin/openssh
bin/net/tools

bin/busybox/full

bin/yash/sys
bin/dbus/sys
bin/dhcpcd/sys
bin/mingetty/sys
bin/wpa/supplicant
{% endblock %}
