{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/nobody
bin/mdns/responder/d
etc/services/runit(srv_dir=mdnsd,srv_command=chown nobody /var/run/mdnsd; hostname -F /etc/hostname; exec mdnsd -debug)
etc/services/runit(srv_dir=mdnsd_exporter,srv_user=nobody,srv_command=exec dns-sd -R hostname _tcp local 0)
{% endblock %}
