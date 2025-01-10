{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nebula/runit/deps
etc/services/runit(srv_deps=bin/nebula/runit/deps,srv_dir=nebula,srv_command=exec env GOMAXPROCS=2 nebula -config /etc/nebula/config.yaml)
{% endblock %}
