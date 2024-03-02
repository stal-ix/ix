{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/avahi/dns
etc/services/runit(srv_dir=avahi_dns,srv_command=exec avahi2dns --port 5354)
{% endblock %}
