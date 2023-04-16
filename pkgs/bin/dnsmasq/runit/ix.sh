{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dnsmasq
etc/user/nobody
bin/dnsmasq/runit/config
etc/services/runit(srv_dir=dnsmasq,srv_command=exec /bin/dnsmasq --log-debug -d -C/etc/dnsmasq.conf -i lo --filter-AAAA)
{% endblock %}
