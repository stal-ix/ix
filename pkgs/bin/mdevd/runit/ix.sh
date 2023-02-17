{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdevd
bin/mdevd/runit/conf
etc/services/runit(srv_slot=system,srv_name=mdevd,srv_command=mdevd -O 4 -f /etc/mdev.conf -C)
{% endblock %}
