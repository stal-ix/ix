{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/chrony
bin/chrony/conf
etc/services/runit(srv_dir=chrony,srv_command=exec chronyd -f /etc/chrony.conf -d)
{% endblock %}
