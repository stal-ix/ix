{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/purge
bin/sched
bin/sched/stale/srvdirs/scripts
{% endblock %}
