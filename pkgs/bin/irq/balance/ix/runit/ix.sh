{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/irq/balance/ix
etc/services/runit(srv_dir=irqbalance,srv_command=exec irqbalance -f -t 3)
{% endblock %}
