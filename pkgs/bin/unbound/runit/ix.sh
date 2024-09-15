{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/user/unbound
bin/unbound/runit/deps
etc/services/runit(srv_deps=bin/unbound/runit/deps,srv_dir=unbound,srv_command=exec /bin/unbound -d -p -v -c /etc/unbound.conf)
{% endblock %}
