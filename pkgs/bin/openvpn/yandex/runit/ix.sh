{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/python
bin/openssh/client
bin/ip/route2
bin/openvpn/yandex
bin/openvpn/yandex/scripts
bin/openvpn/yandex/runit/script(srv_deps=bin/openvpn/yandex/scripts,srv_dir=yandex_vpn)
{% endblock %}
