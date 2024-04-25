{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox
bin/busybox/mdev/conf
etc/services/runit(srv_dir=mdev,srv_command=exec mdev -d -f)
{% endblock %}
