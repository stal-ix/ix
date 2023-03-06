{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/subreaper
bin/unbound/lite
etc/user/unbound
bin/unbound/runit/conf
# TODO(pg83): proper hangup fix
etc/services/runit(srv_dir=unbound,srv_command=exec /bin/subreaper /bin/timeout 300 unbound -d -p -v -c /etc/unbound.conf)
{% endblock %}
