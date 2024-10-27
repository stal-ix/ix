{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sysklogd/runit/deps
etc/services/runit(srv_deps=bin/sysklogd/runit/deps,srv_dir=syslogd,srv_command=exec syslogd -ss -F -f /etc/syslog.conf -P /var/run/syslogd/pid -C /var/run/syslogd/seq)
{% endblock %}
