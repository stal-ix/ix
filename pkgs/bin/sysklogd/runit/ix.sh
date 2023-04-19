{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sysklogd
etc/services/runit(srv_dir=sysklogd,srv_command=exec /bin/syslogd -ss -F -P /var/run/sysklogd/pid -C /var/run/sysklogd/seq)
{% endblock %}
