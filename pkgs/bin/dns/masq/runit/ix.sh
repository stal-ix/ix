{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/dnsmasq
bin/dns/masq/lite
bin/dns/masq/runit/script(srv_deps=bin/dns/masq/lite,srv_dir=dnsmasq)
{% endblock %}
