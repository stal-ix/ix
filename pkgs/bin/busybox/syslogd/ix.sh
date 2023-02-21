{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox
etc/services/runit(srv_dir=syslogd,srv_command=syslogd -n -O /var/log/syslog)
{% endblock %}
