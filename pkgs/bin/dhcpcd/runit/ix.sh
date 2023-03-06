{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dhcpcd/sys
etc/services/runit(srv_dir=dhcpcd,srv_command=exec dhcpcd --nobackground --debug --config /etc/dhcpcd.conf)
{% endblock %}
