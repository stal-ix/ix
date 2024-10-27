{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sysklogd/runit/deps
etc/services/runit(srv_deps=bin/sysklogd/runit/deps,srv_dir=syslogd,srv_command=exec syslogd -ss -k -K -F -f /etc/syslog.conf -P /proc/self/fd/1 -C /dev/null)
{% endblock %}
