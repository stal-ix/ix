{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox/ntpd/runit/deps
etc/services/runit(srv_deps=bin/busybox/ntpd/runit/deps,srv_dir=ntpd,srv_command=exec ntpd -n -d -N)
{% endblock %}
