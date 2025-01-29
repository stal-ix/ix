{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sched
bin/sched/stale/procs/scripts
{% endblock %}
