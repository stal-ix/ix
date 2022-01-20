{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/iw
bin/yash
bin/nano
bin/mdevd
bin/openssh
bin/dhclient
bin/net/tools
bin/busybox/full
{% endblock %}
