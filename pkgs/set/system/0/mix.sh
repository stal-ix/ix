{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sched/staleprocs(delay=10)
set/system/1
{% endblock %}
