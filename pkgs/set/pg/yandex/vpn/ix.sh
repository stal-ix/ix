{% extends '//die/hub.sh' %}

{% block run_deps %}
set/pg/yandex/vpn/dns(srv_deps=bin/dns/proxy,srv_dir=dnsproxy)
set/pg/yandex/vpn/runit(srv_deps=set/pg/yandex/vpn/scripts,srv_dir=yandex_vpn)
set/pg/yandex/vpn/scripts
bin/runsrv
bin/python
bin/openssh/client
bin/ip/route2
bin/openvpn/yandex
bin/dns/proxy
etc/user/dnsproxy
{% endblock %}
