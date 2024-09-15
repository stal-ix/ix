{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdevd/runit/deps
etc/services/runit(srv_deps=bin/mdevd/runit/deps,srv_dir=mdevd,srv_command=exec mdevd -O 4 -f /etc/mdev.conf -C)
{% endblock %}
