{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runit
bin/runit/sys/bin
bin/runit/sys/etc
bin/sched/stale/procs(delay=10)
{% endblock %}
