{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/logovo
etc/services/runit(srv_deps=bin/logovo,srv_dir=logovo_scan,srv_user=pg,srv_command=exec env HOME=/home/pg logovo scan)
{% endblock %}
