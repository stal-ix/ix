{% extends '//die/hub.sh' %}

{% block run_deps %}
set/pg/yandex/vpn/dns(srv_deps=bin/dns/proxy,srv_dir=dnsproxy)
set/pg/yandex/vpn/runit(srv_deps=set/pg/yandex/vpn/runit/deps,srv_dir=yandex_vpn)
set/pg/yandex/vpn/runit/deps
bin/runsrv
bin/dns/proxy
etc/user/dnsproxy
{% endblock %}
