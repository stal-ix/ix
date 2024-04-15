{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nebula/daemon
set/pg/nebula/scripts
etc/services/runit(srv_dir=nebula,srv_command=exec nebula -config /etc/nebula/config.yaml)
{% endblock %}
