{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dhcpcd/sys
etc/services/runit(srv_slot=system,srv_name=dhcpcd,srv_command=dhcpcd --nobackground --debug --config /etc/dhcpcd.conf)
{% endblock %}
