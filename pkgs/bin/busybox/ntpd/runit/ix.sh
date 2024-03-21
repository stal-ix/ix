{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox
bin/busybox/conf
etc/services/runit(srv_dir=ntpd,srv_command=exec ntpd -n -d -N)
{% endblock %}
