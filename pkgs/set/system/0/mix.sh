{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
aux/etc
bin/iw
bin/iwd
bin/nano
bin/runit
bin/seatd
bin/mdevd
bin/dhcpcd
bin/openssh
bin/dbus/sys
bin/net/tools
bin/mingetty/sys
bin/busybox/full
bin/yash/sys
bin/wpa/supplicant
{% endblock %}
