{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nobody
bin/mdns/responder/d
etc/services/runit(srv_dir=mdnsd,srv_command=exec mdnsd -debug)
#etc/service/runit(srv_dir=mdnsd_exporter,srv_command=exec dns-sd)
{% endblock %}
