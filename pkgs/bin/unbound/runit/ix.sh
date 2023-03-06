{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/unbound/ix
etc/user/unbound
bin/unbound/runit/conf
# TODO(pg83): proper hangup fix
etc/services/runit(srv_dir=unbound,srv_command=exec /bin/timeout 300 unbound -d -p -v -c /etc/unbound.conf)
{% endblock %}
