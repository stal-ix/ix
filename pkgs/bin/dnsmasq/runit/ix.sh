{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/dnsmasq
bin/dnsmasq/lite
bin/dnsmasq/runit/script(srv_deps=bin/dnsmasq/lite,srv_dir=dnsmasq)
{% endblock %}
