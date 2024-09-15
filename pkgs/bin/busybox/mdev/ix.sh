{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox/mdev/deps
etc/services/runit(srv_deps=bin/busybox/mdev/deps,srv_dir=mdev,srv_command=exec mdev -d -f)
{% endblock %}
