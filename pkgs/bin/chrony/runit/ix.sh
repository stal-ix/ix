{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/chrony/runit/deps
etc/services/runit(srv_deps=bin/chrony/runit/deps,srv_dir=chrony,srv_command=exec chronyd -f /etc/chrony.conf -d)
{% endblock %}
