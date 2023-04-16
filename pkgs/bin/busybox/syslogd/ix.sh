{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox
etc/services/runit(srv_dir=syslogd,srv_command=exec syslogd -n -O /var/run/syslogd/log)
{% endblock %}
