{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
aux/etc
bin/iw
bin/nano
bin/runit
bin/seatd
bin/mdevd
bin/openssh
bin/dhclient
bin/yash/sys
bin/net/tools
bin/util/linux
bin/busybox/full
{% endblock %}
