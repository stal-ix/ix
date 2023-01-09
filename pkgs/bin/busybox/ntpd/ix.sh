{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sched
bin/busybox
bin/busybox/ntpd/scripts
{% endblock %}
