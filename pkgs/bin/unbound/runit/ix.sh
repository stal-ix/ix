{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/unbound/ix
etc/user/unbound
bin/unbound/runit/conf
etc/services/runit(srv_dir=unbound,srv_command=unbound -d -p -v -c /etc/unbound.conf)
{% endblock %}
