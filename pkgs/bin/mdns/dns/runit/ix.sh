{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdns/dns
bin/mdns/responder/d
etc/services/runit(srv_deps=bin/mdns/dns,srv_dir=mdnsd_dns,srv_user=nobody,srv_command=exec env GOMAXPROCS=2 mdns2dns 5354)
{% endblock %}
