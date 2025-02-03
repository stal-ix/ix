{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sched
bin/sched/stale/pids/scripts
{% endblock %}
