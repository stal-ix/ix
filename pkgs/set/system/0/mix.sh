{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
aux/etc
bin/iw
bin/yash
bin/nano
bin/runit
bin/mdevd
bin/openssh
bin/dhclient
bin/net/tools
bin/busybox/full
{% endblock %}
