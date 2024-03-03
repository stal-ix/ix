{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdns/dns
bin/mdns/responder/d
etc/services/runit(srv_dir=mdns_dns,srv_user=nobody,srv_command=exec mdns2dns 5354)
{% endblock %}
