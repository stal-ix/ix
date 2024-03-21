{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sched
bin/busybox
bin/busybox/conf
bin/busybox/ntpd/scripts
{% endblock %}
